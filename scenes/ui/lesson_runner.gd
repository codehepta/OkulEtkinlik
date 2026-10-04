extends Control
## Bir durağın (düğümün) turlarını sırayla oynatır; hata akışını (tekrar dinle, ipucu,
## çözüm, sona yeniden ekleme) yönetir ve bitişte ilerlemeyi kaydeder (spec §4, §6).

## `Progress.record_node` dönüşü + node_id + time_up.
signal lesson_completed(summary: Dictionary)
## Ev düğmesi: onaysız çıkış, ilerleme kaydedilmez.
signal home_requested

const RETRY_VOICE_COUNT: int = 3
const WRONG_FOR_HINT_1: int = 2
const WRONG_FOR_SOLUTION: int = 3

## Testlerde sahte düğümle değiştirilir.
var narrator: Node = Narrator
var audio: Node = AudioDirector
var progress: Node = Progress
var content: Node = ContentDB
var session_timer: Node = SessionTimer
## Intro ve turlar arası bekleme (sn); testlerde 0.
var step_delay: float = 0.8

var _profile_id: String = ""
var _node_id: String = ""
var _node: Dictionary = {}
var _rng: RandomNumberGenerator = RandomNumberGenerator.new()
## Her öğe: {"index": özgün tur sırası, "round": Dictionary, "retry": bool}
var _queue: Array[Dictionary] = []
var _pos: int = -1
var _requeued: Dictionary = {}
var _results: Array[RoundResult] = []
var _game: MiniGame = null
var _round_wrong: int = 0
var _round_helped: bool = false
var _last_answer_frame: int = -1
var _time_up: bool = false
var _active: bool = false
var _gen: int = 0

@onready var _area: Control = $Host/GameArea as Control
@onready var _home: Button = $TopBar/HomeButton as Button

func _ready() -> void:
	_home.pressed.connect(_on_home_pressed)
	if not session_timer.limit_reached.is_connected(_on_limit_reached):
		session_timer.limit_reached.connect(_on_limit_reached)

func _exit_tree() -> void:
	if session_timer != null and session_timer.limit_reached.is_connected(_on_limit_reached):
		session_timer.limit_reached.disconnect(_on_limit_reached)

func start(profile_id: String, node_id: String, rng_seed: int = -1) -> void:
	_profile_id = profile_id
	_node_id = node_id
	_node = content.node(node_id)
	if rng_seed >= 0:
		_rng.seed = rng_seed
	else:
		_rng.randomize()
	_queue.clear()
	_requeued.clear()
	_results.clear()
	_pos = -1
	_time_up = false
	_active = true
	_gen += 1
	var rounds: Array = _node.get("rounds", [])
	for i: int in rounds.size():
		_queue.append({"index": i, "round": rounds[i], "retry": false})
	narrator.say(str(_node.get("intro_voice", "")))
	await _pause()
	_advance()

func current_round_index() -> int:
	return _pos

func round_count() -> int:
	return _queue.size()

func current_game() -> MiniGame:
	return _game

## Çalışma zamanı sayacı (test için): bu turdaki yanlış sayısı.
func wrong_count() -> int:
	return _round_wrong

func _pause() -> void:
	if step_delay > 0.0 and is_inside_tree():
		var gen: int = _gen
		await get_tree().create_timer(step_delay).timeout
		if gen != _gen:
			return

func _advance() -> void:
	if not _active:
		return
	_pos += 1
	if _pos >= _queue.size():
		_complete(false)
		return
	_load_round(_queue[_pos])

func _load_round(entry: Dictionary) -> void:
	_round_wrong = 0
	_round_helped = false
	_last_answer_frame = -1
	var rd: Dictionary = entry["round"]
	var game: MiniGame = _instantiate(str(rd.get("template", "")))
	if game == null:
		_skip_round()
		return
	game.narrator = narrator
	game.audio = audio
	var outcomes: PackedStringArray = PackedStringArray(_node.get("outcomes", []))
	var mastery: float = 0.0
	if not outcomes.is_empty():
		mastery = float(progress.outcome_mastery(_profile_id, outcomes[0]))
	var diff: int = Mastery.played_difficulty(int(rd.get("difficulty", 1)), mastery)
	var ctx: RoundContext = RoundContext.new()
	ctx.rng.seed = _rng.randi()
	ctx.voice_id = str(rd.get("voice", ""))
	ctx.outcomes = outcomes
	_area.add_child(game)
	_game = game
	game.answered.connect(_on_answered)
	game.finished.connect(_on_finished)
	game.setup(rd.get("params", {}), diff, ctx)

func _instantiate(template_id: String) -> MiniGame:
	if not TemplateRegistry.has(template_id):
		return null
	var path: String = TemplateRegistry.SCENES[template_id]
	if not ResourceLoader.exists(path):
		return null
	var scene: PackedScene = load(path) as PackedScene
	return scene.instantiate() as MiniGame if scene != null else null

## Şablon yüklenemedi: tur atlanır, yardım almış sayılır.
func _skip_round() -> void:
	var r: RoundResult = RoundResult.new()
	r.attempts = 0
	r.wrong = 0
	r.helped = true
	r.outcomes = PackedStringArray(_node.get("outcomes", []))
	_results.append(r)
	_game = null
	_after_round()

func _on_answered(correct: bool) -> void:
	if not _active or correct:
		return
	var frame: int = Engine.get_process_frames()
	if frame == _last_answer_frame or _round_wrong >= WRONG_FOR_SOLUTION:
		return
	_last_answer_frame = frame
	_round_wrong += 1
	if _round_wrong == 1:
		narrator.replay_last()
		audio.play_sfx("sfx.wrong")
		narrator.say("vo.genel.tekrar_dene_%d" % _rng.randi_range(1, RETRY_VOICE_COUNT))
	elif _round_wrong == WRONG_FOR_HINT_1:
		narrator.say("vo.genel.ipucu")
		_game.show_hint(1)
	else:
		_round_helped = true
		narrator.say("vo.genel.cozum")
		var entry: Dictionary = _queue[_pos]
		var idx: int = int(entry["index"])
		if not bool(entry["retry"]) and not _requeued.has(idx):
			_requeued[idx] = true
			_queue.append({"index": idx, "round": entry["round"], "retry": true})
			narrator.say("vo.genel.sonra_tekrar")
		_game.show_hint(2)

func _on_finished(result: RoundResult) -> void:
	if not _active:
		return
	var r: RoundResult = RoundResult.new()
	r.attempts = result.attempts
	r.wrong = _round_wrong
	r.helped = _round_helped or result.helped
	r.outcomes = result.outcomes
	_results.append(r)
	_after_round()

func _after_round() -> void:
	if _time_up:
		_remove_game()
		_complete(true)
		return
	var gen: int = _gen
	await _pause()
	if gen != _gen:
		return
	_remove_game()
	_advance()

func _remove_game() -> void:
	if _game != null and is_instance_valid(_game):
		_game.queue_free()
	_game = null

func _on_limit_reached() -> void:
	_time_up = true

func _on_home_pressed() -> void:
	_active = false
	_gen += 1
	_remove_game()
	home_requested.emit()

func _complete(time_up: bool) -> void:
	_active = false
	var summary: Dictionary = {"stars": 0, "new_sticker": "", "unlocked": ""}
	if not _results.is_empty():
		summary = progress.record_node(_profile_id, _node_id, _results)
	summary["node_id"] = _node_id
	summary["time_up"] = time_up
	lesson_completed.emit(summary)
