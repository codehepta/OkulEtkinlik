extends GutTest
## LessonRunner: ipucu / yeniden sorma akışı, yıldız ve ilerleme kaydı, süre sınırı, zorluk.

const FakeServices: GDScript = preload("res://tests/helpers/fake_services.gd")
const RUNNER_SCENE: String = "res://scenes/ui/lesson_runner.tscn"
const ROOT: String = "res://tests/fixtures/lesson"
const SAVE_DIR: String = "user://lesson_runner_test"
const N1: String = "g1.matematik.u01.n01"
const N2: String = "g1.matematik.u01.n02"

var _fake: Node = null
var _save: Node = null
var _db: Node = null
var _progress: Node = null
var _timer: Node = null
var _runner: Control = null
var _pid: String = ""
var _done_summary: Dictionary = {}

func before_each() -> void:
	_done_summary = {}
	DirAccess.make_dir_recursive_absolute(SAVE_DIR)
	_fake = FakeServices.new()
	add_child_autofree(_fake)
	_save = load("res://autoload/save_service.gd").new()
	_save.set_base_dir(SAVE_DIR)
	_save.load_or_create()
	_db = load("res://autoload/content_db.gd").new()
	_db.has_string = func(_k: String) -> bool: return true
	_db.has_voice = func(_k: String) -> bool: return true
	_db.load_all(ROOT)
	_progress = load("res://autoload/progress.gd").new()
	_progress.save = _save
	_progress.content = _db
	_pid = _progress.create_profile("av.kedi", "Test", 1)
	_timer = load("res://autoload/session_timer.gd").new()
	_timer.save = _save
	add_child_autofree(_timer)

func after_each() -> void:
	for f: String in DirAccess.get_files_at(SAVE_DIR):
		DirAccess.remove_absolute(SAVE_DIR.path_join(f))
	_progress.free()
	_db.free()
	_save.free()

func _start(node_id: String = N1) -> void:
	var scene: PackedScene = load(RUNNER_SCENE) as PackedScene
	_runner = scene.instantiate() as Control
	_runner.narrator = _fake
	_runner.audio = _fake
	_runner.progress = _progress
	_runner.content = _db
	_runner.session_timer = _timer
	_runner.step_delay = 0.0
	_runner.lesson_completed.connect(func(s: Dictionary) -> void: _done_summary = s)
	add_child_autofree(_runner)
	_runner.start(_pid, node_id, 7)

## Doğru seçeneğe dokunur ve tur bitişini bekler.
func _win_round() -> void:
	var g: MiniGame = _runner.current_game()
	var idx: int = _runner.current_round_index()
	g.call("_debug_choose", 1)
	await _until_round_after(idx)

## Tur ilerleyene (ya da ders bitene) kadar bekler; oyun düğümünün sinyaline bağlı kalmaz.
func _until_round_after(idx: int) -> void:
	await wait_until(func() -> bool: return _runner.current_round_index() != idx or _done_summary.size() > 0, 6.0)

func _wrong_answers(n: int) -> void:
	var g: MiniGame = _runner.current_game()
	for i: int in n:
		g.answered.emit(false)
		await wait_process_frames(2)

func test_all_correct_gives_three_stars_and_unlocks() -> void:
	_start()
	assert_eq(_fake.said[0], "fx.vo.n01.intro")
	for i: int in 3:
		await _win_round()
	assert_eq(int(_done_summary.get("stars", 0)), 3)
	assert_eq(str(_done_summary.get("node_id", "")), N1)
	assert_eq(str(_done_summary.get("unlocked", "")), N2)
	assert_false(bool(_done_summary.get("time_up", true)))
	assert_eq(_progress.node_state(_pid, N2), "open")
	assert_eq(_progress.best_stars(_pid, N1), 3)

func test_two_wrong_triggers_hint_level_1() -> void:
	_start()
	await _wrong_answers(1)
	assert_eq(_fake.replays, 1)
	assert_true(_fake.sfx.has("sfx.wrong"))
	var retry: bool = false
	for id: String in _fake.said:
		if id.begins_with("vo.genel.tekrar_dene_"):
			retry = true
	assert_true(retry)
	assert_false(_fake.said.has("vo.genel.ipucu"))
	await _wrong_answers(1)
	assert_true(_fake.said.has("vo.genel.ipucu"))
	assert_false(_fake.said.has("vo.genel.cozum"))

func test_three_wrong_requeues_round_once() -> void:
	_start()
	assert_eq(_runner.round_count(), 3)
	await _wrong_answers(3)
	assert_true(_fake.said.has("vo.genel.cozum"))
	assert_true(_fake.said.has("vo.genel.sonra_tekrar"))
	assert_eq(_runner.round_count(), 4)
	await _until_round_after(0)
	await _win_round()
	await _win_round()
	assert_eq(_runner.current_round_index(), 3, "yeniden eklenen tur sonda")
	await _wrong_answers(3)
	assert_eq(_runner.round_count(), 4, "bir daha eklenmez")
	await wait_until(func() -> bool: return _done_summary.size() > 0, 6.0)
	assert_eq(int(_done_summary.get("stars", 0)), 1, "6 yanlış -> 1 yıldız")

func test_double_answer_counted_once() -> void:
	_start()
	var g: MiniGame = _runner.current_game()
	g.answered.emit(false)
	g.answered.emit(false)
	assert_eq(_runner.wrong_count(), 1)
	await wait_process_frames(2)
	assert_false(_fake.said.has("vo.genel.ipucu"))

func test_time_up_finishes_after_current_round() -> void:
	_start()
	_timer.limit_reached.emit()
	assert_eq(_done_summary.size(), 0, "tur bitmeden sonlanmaz")
	await _win_round()
	assert_true(bool(_done_summary.get("time_up", false)))
	assert_eq(int(_done_summary.get("stars", 0)), 3)
	assert_eq(_progress.best_stars(_pid, N1), 3, "biten turlar kaydedilir")

func test_difficulty_uses_mastery() -> void:
	var outs: Dictionary = _progress._profile(_pid)["outcomes"]
	outs["TEST.1"] = {"mastery": 0.9, "box": 1, "due": 0}
	_start()
	assert_eq(_runner.current_game().difficulty, 2)
