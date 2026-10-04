extends GutTest
## LessonRunner + Faz 5a şablonları (sort_bins, scenario): gerçek runner akışında oynanır;
## sort_bins üç yanlışta çözülür ve sona eklenir; scenario iki yanlışta ipucu verir, denenen kart kapanır.

const FakeServices: GDScript = preload("res://tests/helpers/fake_services.gd")
const RUNNER_SCENE: String = "res://scenes/ui/lesson_runner.tscn"
const ROOT: String = "res://tests/fixtures/lesson_faz5"
const SAVE_DIR: String = "user://faz5_runner_test"
const N1: String = "g1.matematik.u01.n01"
const ROUNDS: int = 2

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
	_db.outcomes_path = "res://tests/fixtures/outcomes.json"
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

func _start() -> void:
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
	_runner.start(_pid, N1, 7)
	await wait_until(func() -> bool: return _runner.current_game() != null, 6.0)

## Şimdiki oyun girdiye açılana kadar bekler (şablon kilidi + runner geri bildirimi).
func _ready_for_input() -> MiniGame:
	var ok: bool = await wait_until(func() -> bool:
		var g: MiniGame = _runner.current_game()
		return g != null and g._can_input() and not _runner.is_feedback_busy(), 8.0)
	assert_true(ok, "oyun girdiye açılmalı")
	return _runner.current_game()

## Turu doğru cevaplarla bitirir (çok adımlı şablonlarda her adım).
func _win_round() -> void:
	var idx: int = _runner.current_round_index()
	for step: int in 8:
		if _runner.current_round_index() != idx or _done_summary.size() > 0:
			return
		var g: MiniGame = await _ready_for_input()
		if _runner.current_round_index() != idx:
			return
		g.call("_debug_answer", true)
		await wait_until(func() -> bool:
			var cg: MiniGame = _runner.current_game()
			return _runner.current_round_index() != idx or _done_summary.size() > 0 or (cg != null and cg._can_input()), 4.0)
	assert_true(_runner.current_round_index() != idx or _done_summary.size() > 0, "tur bitmeli")

func test_faz5_templates_play_through_runner() -> void:
	await _start()
	assert_eq(_runner.round_count(), ROUNDS)
	var seen: Array[String] = []
	for i: int in ROUNDS:
		var g: MiniGame = _runner.current_game()
		seen.append(g.scene_file_path.get_file().get_basename())
		await _win_round()
	assert_eq(seen, ["sort_bins", "scenario"] as Array[String])
	var done: bool = await wait_until(func() -> bool: return _done_summary.size() > 0, 6.0)
	assert_true(done)
	assert_eq(int(_done_summary.get("stars", 0)), 3)

## Bir yanlış cevap verir ve runner'ın geri bildirimini başlatmasını bekler.
func _answer_wrong(g: MiniGame) -> void:
	var before: int = _runner.wrong_count()
	g.call("_debug_answer", false)
	await wait_until(func() -> bool: return _runner.wrong_count() > before, 6.0)

func test_sort_bins_three_wrong_solves_and_requeues() -> void:
	await _start()
	var g: MiniGame = _runner.current_game()
	for k: int in 3:
		var ready: MiniGame = await _ready_for_input()
		assert_eq(ready, g, "aynı tur")
		_fake.said.clear()
		await _answer_wrong(g)
		await wait_process_frames(2)
		if k == 1:
			assert_true(_fake.said.has("vo.genel.ipucu"), "2. yanlışta ipucu")
	var moved: bool = await wait_until(func() -> bool: return _runner.current_round_index() != 0, 10.0)
	assert_true(moved, "çözüm turu bitirmeli")
	assert_eq(_runner.round_count(), ROUNDS + 1, "tur bir kez sona eklenir")

func test_scenario_two_wrong_gives_hint_then_only_right_remains() -> void:
	await _start()
	await _win_round()
	var g: MiniGame = _runner.current_game()
	assert_eq(g.scene_file_path.get_file().get_basename(), "scenario")
	for k: int in 2:
		await _ready_for_input()
		_fake.said.clear()
		await _answer_wrong(g)
		await wait_process_frames(2)
	assert_true(await wait_until(func() -> bool: return _fake.said.has("fx.vo.r.scenario.ipucu"), 6.0), "2. yanlışta şablonun ipucu satırı")
	assert_true(_fake.said.has("vo.genel.ipucu"))
	var ready: MiniGame = await _ready_for_input()
	assert_eq((ready.call("touch_targets") as Array).size(), 1, "yalnızca doğru kart seçilebilir kalır")
	ready.call("_debug_answer", false)
	await wait_process_frames(2)
	assert_eq(_runner.wrong_count(), 2, "denenmemiş yanlış kalmayınca yeni yanlış oluşmaz")
	await _win_round()
	var done: bool = await wait_until(func() -> bool: return _done_summary.size() > 0, 6.0)
	assert_true(done, "ders tamamlanmalı")
