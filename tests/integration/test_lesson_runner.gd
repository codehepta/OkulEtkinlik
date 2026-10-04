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
	await wait_until(func() -> bool: return _runner.current_game() != null or _done_summary.size() > 0, 6.0)

## Doğru seçeneğe dokunur ve tur bitişini bekler.
func _win_round() -> void:
	var g: MiniGame = _runner.current_game()
	var idx: int = _runner.current_round_index()
	g.call("_debug_choose", 1)
	await _until_round_after(idx)

## Tur ilerleyene (ya da ders bitene) kadar bekler; oyun düğümünün sinyaline bağlı kalmaz.
func _until_round_after(idx: int) -> void:
	var ok: bool = await wait_until(func() -> bool: return _runner.current_round_index() != idx or _done_summary.size() > 0, 6.0)
	assert_true(ok, "tur ilerlemeli")

func _feedback_done() -> void:
	var ok: bool = await wait_until(func() -> bool: return not _runner.is_feedback_busy(), 6.0)
	assert_true(ok, "geri bildirim bitmeli")

func _wrong_answers(n: int) -> void:
	var g: MiniGame = _runner.current_game()
	for i: int in n:
		g.answered.emit(false)
		await wait_process_frames(1)
		await _feedback_done()

func test_all_correct_gives_three_stars_and_unlocks() -> void:
	await _start()
	assert_eq(_fake.said[0], "fx.vo.n01.intro")
	await wait_process_frames(3)
	assert_true(_fake.said.has("fx.vo.n01.r01"), "tur yönergesi okunmalı")
	for i: int in 3:
		await _win_round()
	assert_eq(int(_done_summary.get("stars", 0)), 3)
	assert_eq(str(_done_summary.get("node_id", "")), N1)
	assert_eq(str(_done_summary.get("unlocked", "")), N2)
	assert_false(bool(_done_summary.get("time_up", true)))
	assert_eq(_progress.node_state(_pid, N2), "open")
	assert_eq(_progress.best_stars(_pid, N1), 3)

func test_two_wrong_triggers_hint_level_1() -> void:
	await _start()
	await wait_process_frames(3)
	assert_eq(_fake.said.count("fx.vo.n01.r01"), 1)
	await _wrong_answers(1)
	assert_true(_fake.sfx.has("sfx.wrong"))
	var retry: bool = false
	for id: String in _fake.said:
		if id.begins_with("vo.genel.tekrar_dene_"):
			retry = true
	assert_true(retry)
	assert_eq(_fake.said.count("fx.vo.n01.r01"), 2, "yönerge yeniden okunur")
	assert_false(_fake.said.has("vo.genel.ipucu"))
	await _wrong_answers(1)
	assert_true(_fake.said.has("vo.genel.ipucu"))
	assert_false(_fake.said.has("vo.genel.cozum"))
	assert_true(_fake.said.has("vo.sayi.1"), "show_hint(1) çağrıldı (count_choose sayarak okur)")
	assert_true(_fake.said.find("vo.sayi.1") > _fake.said.find("vo.genel.ipucu"), "önce ipucu satırı")

func test_three_wrong_requeues_round_once() -> void:
	await _start()
	assert_eq(_runner.round_count(), 3)
	await _wrong_answers(3)
	assert_true(_fake.said.has("vo.genel.cozum"))
	assert_eq(_runner.round_count(), 4)
	await _until_round_after(0)
	assert_true(_fake.said.has("vo.genel.sonra_tekrar"))
	assert_true(_fake.said.find("vo.genel.sonra_tekrar") > _fake.said.find("vo.genel.cozum"))
	assert_true(_fake.said.find("vo.genel.sonra_tekrar") < _fake.said.find("fx.vo.n01.r02"), "sonraki turdan önce")
	await _win_round()
	await _win_round()
	assert_eq(_runner.current_round_index(), 3, "yeniden eklenen tur sonda")
	await _wrong_answers(3)
	assert_eq(_runner.round_count(), 4, "bir daha eklenmez")
	var done: bool = await wait_until(func() -> bool: return _done_summary.size() > 0, 6.0)
	assert_true(done)
	assert_eq(int(_done_summary.get("stars", 0)), 1, "6 yanlış -> 1 yıldız")

func test_double_answer_counted_once() -> void:
	await _start()
	var g: MiniGame = _runner.current_game()
	g.answered.emit(false)
	g.answered.emit(false)
	assert_eq(_runner.wrong_count(), 1)
	await wait_process_frames(2)
	assert_false(_fake.said.has("vo.genel.ipucu"))

func test_time_up_finishes_after_current_round() -> void:
	await _start()
	_timer.limit_reached.emit()
	assert_eq(_done_summary.size(), 0, "tur bitmeden sonlanmaz")
	await _win_round()
	assert_true(bool(_done_summary.get("time_up", false)))
	assert_eq(int(_done_summary.get("stars", -1)), 0)
	assert_eq(str(_done_summary.get("unlocked", "x")), "")
	assert_eq(_progress.best_stars(_pid, N1), 0, "kısmi kayıt yıldız vermez")
	assert_eq(_progress.node_state(_pid, N2), "locked")
	assert_almost_eq(_progress.outcome_mastery(_pid, "TEST.1"), 0.3, 0.001, "oynanan tur ustalığa işlenir")

func test_time_up_during_last_round_records_normally() -> void:
	await _start()
	await _win_round()
	await _win_round()
	_timer.limit_reached.emit()
	await _win_round()
	assert_true(bool(_done_summary.get("time_up", false)))
	assert_eq(int(_done_summary.get("stars", 0)), 3)
	assert_eq(_progress.best_stars(_pid, N1), 3)

func test_home_requested_without_saving() -> void:
	await _start()
	var homes: Array[bool] = []
	_runner.home_requested.connect(func() -> void: homes.append(true))
	_runner.get_node("TopBar/HomeButton").emit_signal("pressed")
	assert_eq(homes.size(), 1)
	await wait_process_frames(3)
	assert_eq(_done_summary.size(), 0)
	assert_eq(_progress.best_stars(_pid, N1), 0)

func test_skipped_round_does_not_affect_mastery_or_stars() -> void:
	(_db.node(N1)["rounds"][0] as Dictionary)["template"] = "yok_sablon"
	await _start(N1)
	await _win_round()
	await _win_round()
	var done: bool = await wait_until(func() -> bool: return _done_summary.size() > 0, 4.0)
	assert_true(done)
	assert_eq(int(_done_summary.get("stars", 0)), 3, "atlanan tur yanlış sayılmaz")
	assert_almost_eq(_progress.outcome_mastery(_pid, "TEST.1"), 0.51, 0.001, "yalnızca oynanan iki tur işlenir")

func test_all_rounds_skipped_awards_nothing() -> void:
	(_db.node(N2)["rounds"][0] as Dictionary)["template"] = "yok_sablon"
	await _start(N2)
	var done: bool = await wait_until(func() -> bool: return _done_summary.size() > 0, 4.0)
	assert_true(done)
	assert_eq(int(_done_summary.get("stars", -1)), 0, "hiç tur oynanmadı: yıldız yok")
	assert_eq(str(_done_summary.get("new_sticker", "x")), "")
	assert_eq(str(_done_summary.get("unlocked", "x")), "")
	assert_eq(_progress.best_stars(_pid, N2), 0, "kayıt yapılmaz")
	assert_eq(_progress.outcome_mastery(_pid, "TEST.1"), 0.0)

## line_finished'i gecikmeli yayan yavaş anlatıcı (gerçek TTS'e benzer).
class SlowFake:
	extends "res://tests/helpers/fake_services.gd"
	var delay: float = 0.0
	func say(id: String) -> void:
		said.append(id)
		if delay <= 0.0 or not is_inside_tree():
			line_finished.emit.call_deferred(id)
			return
		await get_tree().create_timer(delay).timeout
		line_finished.emit(id)

func test_tap_during_feedback_narration_is_ignored() -> void:
	var slow: SlowFake = SlowFake.new()
	add_child_autofree(slow)
	_fake = slow
	await _start()
	await wait_process_frames(3)
	var g: MiniGame = _runner.current_game()
	var right: int = int(g.call("_debug_correct_index"))
	var wrong: int = (right + 1) % 3
	slow.delay = 1.5
	g.call("_debug_choose", wrong)
	assert_eq(g.attempts, 1)
	await wait_seconds(0.7)
	assert_true(_runner.is_feedback_busy(), "geri bildirim hâlâ okunuyor")
	g.call("_debug_choose", right)
	assert_eq(g.attempts, 1, "anlatım sürerken dokunma yok sayılır")
	assert_eq(_runner.current_round_index(), 0)
	slow.delay = 0.0
	await _feedback_done()
	g.call("_debug_choose", right)
	assert_eq(g.attempts, 2, "geri bildirim bitince giriş açılır")

func test_difficulty_uses_mastery() -> void:
	var outs: Dictionary = _progress._profile(_pid)["outcomes"]
	outs["TEST.1"] = {"mastery": 0.9, "box": 1, "due": 0}
	await _start()
	assert_eq(_runner.current_game().difficulty, 2)

# --- Ders ekranı düzeni: bölge arka planı, tur göstergesi, Bilge ---

func test_region_background_from_subject() -> void:
	var script: GDScript = load(RUNNER_SCENE.replace(".tscn", ".gd")) as GDScript
	assert_eq(script.region_bg_key("matematik"), "region.sayi_ormani.bg")
	assert_eq(script.region_bg_key("fen"), "region.kesif_laboratuvari.bg")
	assert_eq(script.region_bg_key("yok"), "")
	await _start()
	var bg: TextureRect = _runner.get_node("Background") as TextureRect
	assert_not_null(bg.texture, "Sayı Ormanı arka planı yüklenmeli")

func test_round_dots_follow_progress_and_requeue() -> void:
	await _start()
	var dots: Control = _runner.get_node("TopBar/RoundDots") as Control
	assert_eq(int(dots.call("total_count")), 3)
	assert_eq(int(dots.call("done_count")), 0)
	await _win_round()
	assert_eq(int(dots.call("done_count")), 1)
	await _wrong_answers(3)
	assert_eq(int(dots.call("total_count")), 4, "yeniden eklenen tur göstergede de görünür")

func test_bilge_talks_while_line_plays() -> void:
	await _start()
	var bilge: Control = _runner.get_node("Bilge") as Control
	assert_true(bool(bilge.call("has_figure")), "Bilge görseli (poz ya da sayfa kesiti) olmalı")
	_runner.call("_set_talking", true)
	assert_true(bool(bilge.call("is_talking")))
	_runner.call("_set_talking", false)
	assert_false(bool(bilge.call("is_talking")))
