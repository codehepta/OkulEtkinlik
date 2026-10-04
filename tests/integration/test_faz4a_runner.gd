extends GutTest
## LessonRunner + Faz 4a Türkçe şablonları (sessiz okuma kipli story ve drag_match dahil):
## her şablon gerçek runner akışında oynanır; üç yanlışta ipucu 1 ve çözüm (show_hint(2)) gelir,
## tur yardımlı olarak bir kez sona eklenir.

const FakeServices: GDScript = preload("res://tests/helpers/fake_services.gd")
const RUNNER_SCENE: String = "res://scenes/ui/lesson_runner.tscn"
const ROOT: String = "res://tests/fixtures/lesson_faz4a"
const SAVE_DIR: String = "user://faz4a_runner_test"
const N1: String = "g1.turkce.u01.n01"
const ROUNDS: int = 4

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
	for step: int in 12:
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

func test_faz4a_templates_play_through_runner() -> void:
	await _start()
	assert_eq(_runner.round_count(), ROUNDS)
	var seen: Array[String] = []
	for i: int in ROUNDS:
		var g: MiniGame = _runner.current_game()
		seen.append(g.scene_file_path.get_file().get_basename())
		await _win_round()
	assert_eq(seen, ["trace", "syllable_build", "story", "drag_match"] as Array[String])
	var done: bool = await wait_until(func() -> bool: return _done_summary.size() > 0, 6.0)
	assert_true(done)
	assert_eq(int(_done_summary.get("stars", 0)), 3)

func test_faz4a_three_wrong_hint_and_requeue() -> void:
	await _start()
	for i: int in ROUNDS:
		var idx: int = _runner.current_round_index()
		var g: MiniGame = _runner.current_game()
		var name: String = g.scene_file_path.get_file().get_basename()
		for k: int in 3:
			var ready: MiniGame = await _ready_for_input()
			assert_eq(ready, g, name + ": aynı tur")
			_fake.said.clear()
			g.call("_debug_answer", false)
			await wait_process_frames(2)
			if k == 1:
				assert_true(_fake.said.has("vo.genel.ipucu"), name + ": 2. yanlışta ipucu")
		var moved: bool = await wait_until(func() -> bool: return _runner.current_round_index() != idx, 10.0)
		assert_true(moved, name + ": çözüm turu bitirmeli")
		assert_eq(_runner.round_count(), ROUNDS + i + 1, name + ": tur bir kez sona eklenir")
	for i: int in ROUNDS:
		await _win_round()
	var done: bool = await wait_until(func() -> bool: return _done_summary.size() > 0, 6.0)
	assert_true(done, "ders tamamlanmalı")
	assert_eq(int(_done_summary.get("stars", 0)), 1, "12 yanlış -> 1 yıldız")

## Sessiz okuma: runner yönergeyi okur, okuma parçasını okumaz; ipucu 1 parçayı okutur.
func test_faz4a_silent_story_voice_flow() -> void:
	await _start()
	await _win_round()
	await _win_round()
	var g: MiniGame = await _ready_for_input()
	assert_eq(str(g.call("phase")), "read")
	assert_true(_fake.said.has("fx.vo.r.story"), "yönerge seslendirilir")
	assert_false(_fake.said.has("fx.vo.story.p1"), "okuma parçası seslendirilmez")
	for k: int in 2:
		g = await _ready_for_input()
		g.call("_debug_answer", false)
		await wait_process_frames(2)
	var hinted: bool = await wait_until(func() -> bool: return _fake.said.has("fx.vo.story.p2"), 8.0)
	assert_true(hinted, "2. yanlışta ilgili sayfa (page: 1) seslendirilir")
