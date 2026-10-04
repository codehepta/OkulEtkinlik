extends Control
## Bir durağın (düğümün) turlarını sırayla oynatır; hata akışını (tekrar dinle, ipucu,
## çözüm, sona yeniden ekleme) yönetir ve bitişte ilerlemeyi kaydeder (spec §4, §6).

## `Progress.record_node` (tekrarda `record_review`) dönüşü + node_id + time_up + review.
signal lesson_completed(summary: Dictionary)
## Ev düğmesi: onaysız çıkış, ilerleme kaydedilmez.
signal home_requested

const RETRY_VOICE_COUNT: int = 3
const WRONG_FOR_HINT_1: int = 2
const WRONG_FOR_SOLUTION: int = 3
## Bir anlatım satırını beklerken en fazla bu kadar sn beklenir (takılmayı önler).
const SAY_TIMEOUT_SECONDS: float = 10.0
## Kurulumda kendi sesini (hedef sesi, hikâye sayfası) okuyan şablonlar: yönerge önce okunur,
## sonra kurulur.
const SPEAKS_ON_SETUP: Array[String] = ["listen_find", "story"]

## Testlerde sahte düğümle değiştirilir.
var narrator: Node = Narrator
var audio: Node = AudioDirector
var progress: Node = Progress
var content: Node = ContentDB
var session_timer: Node = SessionTimer
## AppState.goto enjekte eder; enter() servisleri buradan alır.
var app: Node = AppState
## Intro ve turlar arası bekleme (sn); testlerde 0.
var step_delay: float = 0.8

var _profile_id: String = ""
var _node_id: String = ""
## Tekrar Bulutu oturumu: turlar vadesi gelen çıktılardan seçilir, düğüm kaydı yapılmaz.
var _review: bool = false
var _node: Dictionary = {}
var _rng: RandomNumberGenerator = RandomNumberGenerator.new()
## Her öğe: {"index": özgün tur sırası, "round": Dictionary, "retry": bool}
var _queue: Array[Dictionary] = []
var _pos: int = -1
var _requeued: Dictionary = {}
var _results: Array[RoundResult] = []
## Atlanan (şablonu yüklenemeyen) turların _results içindeki sıraları.
var _skipped: Dictionary = {}
var _game: MiniGame = null
var _round_wrong: int = 0
var _round_helped: bool = false
var _last_answer_frame: int = -1
var _time_up: bool = false
var _active: bool = false
var _gen: int = 0
var _feedback_busy: bool = false
var _pending_later: bool = false

@onready var _area: Control = $Host/GameArea as Control
@onready var _home: Button = $TopBar/HomeButton as Button
@onready var _background: TextureRect = $Background as TextureRect
@onready var _dots: Control = $TopBar/RoundDots as Control
@onready var _bilge: Control = $Bilge as Control
## Bilge'nin konuşma hareketi için dinlenen anlatıcı.
var _talk_source: Node = null

func _ready() -> void:
	_home.pressed.connect(_on_home_pressed)
	if not session_timer.limit_reached.is_connected(_on_limit_reached):
		session_timer.limit_reached.connect(_on_limit_reached)

func _exit_tree() -> void:
	if session_timer != null and session_timer.limit_reached.is_connected(_on_limit_reached):
		session_timer.limit_reached.disconnect(_on_limit_reached)
	_listen_narrator(null)

## AppState.goto("lesson", {"node_id": id}) giriş noktası: servisleri uygulamadan alır,
## bitişte sonuç ekranına, ev düğmesinde patikaya geçer.
func enter(args: Dictionary) -> void:
	narrator = app.narrator
	audio = app.audio
	progress = app.progress
	content = app.content
	if session_timer != app.session_timer:
		if session_timer.limit_reached.is_connected(_on_limit_reached):
			session_timer.limit_reached.disconnect(_on_limit_reached)
		session_timer = app.session_timer
		session_timer.limit_reached.connect(_on_limit_reached)
	step_delay = 0.8 * float(app.anim_scale)
	var node_id: String = str(args.get("node_id", ""))
	var review_subject: String = str(args.get("review", ""))
	var subject: String = review_subject if review_subject != "" else node_id.get_slice(".", 1)
	lesson_completed.connect(func(summary: Dictionary) -> void:
		var result: Dictionary = summary.duplicate()
		result["subject"] = subject
		app.goto("result", result))
	home_requested.connect(func() -> void: app.goto("region_path", {"subject": subject}))
	if review_subject != "":
		start_review(app.profile_id, review_subject)
	else:
		start(app.profile_id, node_id)

func start(profile_id: String, node_id: String, rng_seed: int = -1) -> void:
	_seed(rng_seed)
	_review = false
	_begin(profile_id, node_id, content.node(node_id), node_id.get_slice(".", 1))

## Tekrar Bulutu: dersin vadesi gelen çıktılarından karışık turlar (spec §3.4).
## Oynanacak tur yoksa hemen yıldızsız biter.
func start_review(profile_id: String, subject: String, rng_seed: int = -1) -> void:
	_seed(rng_seed)
	_review = true
	_begin(profile_id, "", progress.review_node(profile_id, subject, _rng), subject)

func is_review() -> bool:
	return _review

func _seed(rng_seed: int) -> void:
	if rng_seed >= 0:
		_rng.seed = rng_seed
	else:
		_rng.randomize()

func _begin(profile_id: String, node_id: String, node: Dictionary, subject: String) -> void:
	_profile_id = profile_id
	_node_id = node_id
	_node = node
	_queue.clear()
	_requeued.clear()
	_results.clear()
	_skipped.clear()
	_pos = -1
	_time_up = false
	_active = true
	_gen += 1
	var gen: int = _gen
	var rounds: Array = _node.get("rounds", [])
	for i: int in rounds.size():
		_queue.append({"index": i, "round": rounds[i], "retry": false})
	_apply_region(subject)
	_listen_narrator(narrator)
	_update_dots()
	await _say(str(_node.get("intro_voice", "")))
	if _stale(gen):
		return
	await _pause()
	if _stale(gen):
		return
	_advance()

## Altyazı balonu üstte: cevap seçenekleri ve sürükleme yuvaları alt yarıdadır.
func subtitle_placement() -> String:
	return "top"

func current_round_index() -> int:
	return _pos

func round_count() -> int:
	return _queue.size()

func current_game() -> MiniGame:
	return _game

## Dersin bölge arka planı anahtarı (konudan); konu tanımsızsa boş.
static func region_bg_key(subject: String) -> String:
	if not ContentDB.SUBJECT_REGION.has(subject):
		return ""
	return "region.%s.bg" % ContentDB.SUBJECT_REGION[subject]

## Arka plan bölge görseli; görsel yoksa sahnenin sıcak düz zemini kalır.
func _apply_region(subject: String) -> void:
	var key: String = region_bg_key(subject)
	_background.texture = AssetRegistry.texture(key) if key != "" else null

func _update_dots() -> void:
	if _dots == null:
		return
	var current: int = _pos if _pos >= 0 and _pos < _queue.size() else -1
	_dots.call("set_progress", clampi(_pos, 0, _queue.size()), current, _queue.size())

## Bilge, anlatıcı bir satır okurken sallanır.
func _listen_narrator(n: Node) -> void:
	var old: Node = _talk_source
	if old != null and is_instance_valid(old):
		if old.has_signal("subtitle_requested") and old.is_connected("subtitle_requested", _on_talk_start):
			old.disconnect("subtitle_requested", _on_talk_start)
		if old.has_signal("line_finished") and old.is_connected("line_finished", _on_talk_end):
			old.disconnect("line_finished", _on_talk_end)
		if old.has_signal("line_stopped") and old.is_connected("line_stopped", _on_talk_stop):
			old.disconnect("line_stopped", _on_talk_stop)
	_talk_source = n
	if n == null:
		return
	if n.has_signal("subtitle_requested"):
		n.connect("subtitle_requested", _on_talk_start)
	if n.has_signal("line_finished"):
		n.connect("line_finished", _on_talk_end)
	if n.has_signal("line_stopped"):
		n.connect("line_stopped", _on_talk_stop)

func _on_talk_start(_text: String) -> void:
	_set_talking(true)

func _on_talk_end(_id: String) -> void:
	_set_talking(false)

func _on_talk_stop() -> void:
	_set_talking(false)

func _set_talking(on: bool) -> void:
	if _bilge != null and is_instance_valid(_bilge):
		_bilge.call("set_talking", on)

## Çalışma zamanı sayacı (test için): bu turdaki yanlış sayısı.
func wrong_count() -> int:
	return _round_wrong

## Runner geri bildirim satırlarını okurken true (cevaplar yok sayılır).
func is_feedback_busy() -> bool:
	return _feedback_busy

func _stale(gen: int) -> bool:
	return gen != _gen or not _active

func _pause() -> void:
	if step_delay > 0.0 and is_inside_tree():
		await get_tree().create_timer(step_delay).timeout

## Satırı okutur ve bitmesini bekler; satır_bitti gelmezse zaman aşımında devam eder.
## Ardışık satırlar böylece birbirini kesmez.
func _say(id: String) -> void:
	if id == "":
		return
	var gen: int = _gen
	var state: Dictionary = {"done": false}
	var cb: Callable = func(finished_id: String) -> void:
		if finished_id == id:
			state["done"] = true
	narrator.line_finished.connect(cb)
	_set_talking(true)
	narrator.say(id)
	var waited: float = 0.0
	while not bool(state["done"]) and waited < SAY_TIMEOUT_SECONDS and gen == _gen and is_inside_tree():
		await get_tree().process_frame
		waited += get_process_delta_time()
	if is_instance_valid(narrator) and narrator.line_finished.is_connected(cb):
		narrator.line_finished.disconnect(cb)
	_set_talking(false)

func _advance() -> void:
	if not _active:
		return
	_pos += 1
	_update_dots()
	if _pos >= _queue.size():
		_complete(_time_up, false)
		return
	if _time_up:
		_complete(true, true)
		return
	_load_round(_queue[_pos])

func _load_round(entry: Dictionary) -> void:
	_round_wrong = 0
	_round_helped = false
	_last_answer_frame = -1
	_feedback_busy = false
	_pending_later = false
	var gen: int = _gen
	var rd: Dictionary = entry["round"]
	var template_id: String = str(rd.get("template", ""))
	var game: MiniGame = _instantiate(template_id)
	if game == null:
		_skip_round()
		return
	game.narrator = narrator
	game.audio = audio
	# Tekrar turları kendi düğümlerinin çıktılarını taşır.
	var outcomes: PackedStringArray = PackedStringArray(rd.get("outcomes", _node.get("outcomes", [])))
	var mastery: float = 0.0
	if not outcomes.is_empty():
		mastery = float(progress.outcome_mastery(_profile_id, outcomes[0]))
	var diff: int = Mastery.played_difficulty(int(rd.get("difficulty", 1)), mastery)
	var ctx: RoundContext = RoundContext.new()
	ctx.rng.seed = _rng.randi()
	ctx.voice_id = str(rd.get("voice", ""))
	ctx.outcomes = outcomes
	ctx.grade = grade_of(_node_id)
	_area.add_child(game)
	_game = game
	game.answered.connect(_on_answered)
	game.finished.connect(_on_finished)
	if SPEAKS_ON_SETUP.has(template_id):
		game.input_locked = true
		await _say(ctx.voice_id)
		if _stale(gen) or _game != game:
			return
		game.setup(rd.get("params", {}), diff, ctx)
	else:
		game.setup(rd.get("params", {}), diff, ctx)
		await _say(ctx.voice_id)

## Düğüm kimliğindeki sınıf (g<N>.…); tanınmazsa 1.
static func grade_of(node_id: String) -> int:
	var head: String = node_id.get_slice(".", 0)
	if head.length() >= 2 and head.begins_with("g") and head.substr(1).is_valid_int():
		return clampi(int(head.substr(1)), 1, 3)
	return 1

func _instantiate(template_id: String) -> MiniGame:
	if not TemplateRegistry.has(template_id):
		return null
	var path: String = TemplateRegistry.SCENES[template_id]
	if not ResourceLoader.exists(path):
		return null
	var scene: PackedScene = load(path) as PackedScene
	return scene.instantiate() as MiniGame if scene != null else null

## Şablon yüklenemedi: tur atlanır. Çıktı kodu verilmediği için ustalık ve yıldız etkilenmez.
func _skip_round() -> void:
	var r: RoundResult = RoundResult.new()
	r.helped = true
	_skipped[_results.size()] = true
	_results.append(r)
	_game = null
	_after_round()

func _on_answered(correct: bool) -> void:
	if _active and correct and _bilge != null:
		_bilge.call("cheer")
	if not _active or correct or _feedback_busy:
		return
	var frame: int = Engine.get_process_frames()
	if frame == _last_answer_frame or _round_wrong >= WRONG_FOR_SOLUTION:
		return
	_last_answer_frame = frame
	_round_wrong += 1
	_feedback_busy = true
	var gen: int = _gen
	var game: MiniGame = _game
	var round_voice: String = str((_queue[_pos]["round"] as Dictionary).get("voice", ""))
	# Şablon yanlış cevaptan 0.6 sn sonra kendi kilidini açar; geri bildirim satırları
	# bitene kadar dokunmaları runner tutar (ipucu adımları atlanmasın).
	game.runner_hold = true
	if _round_wrong == 1:
		audio.play_sfx("sfx.wrong")
		await _say("vo.genel.tekrar_dene_%d" % _rng.randi_range(1, RETRY_VOICE_COUNT))
		if _stale(gen) or _game != game:
			return
		await _say(round_voice)
		if _stale(gen) or _game != game:
			return
		_release(game)
	elif _round_wrong == WRONG_FOR_HINT_1:
		await _say("vo.genel.ipucu")
		if _stale(gen) or _game != game:
			return
		game.show_hint(1)
		_release(game)
	else:
		_round_helped = true
		var entry: Dictionary = _queue[_pos]
		var idx: int = int(entry["index"])
		if not bool(entry["retry"]) and not _requeued.has(idx):
			_requeued[idx] = true
			_queue.append({"index": idx, "round": entry["round"], "retry": true})
			_pending_later = true
			_update_dots()
		await _say("vo.genel.cozum")
		if _stale(gen) or _game != game:
			return
		# Çözümü şablon kendisi gösterip turu bitirir; tutma bırakılmaz.
		game.show_hint(2)
		_feedback_busy = false

func _release(game: MiniGame) -> void:
	_feedback_busy = false
	game.runner_hold = false

func _on_finished(result: RoundResult) -> void:
	if not _active:
		return
	var r: RoundResult = RoundResult.new()
	r.attempts = result.attempts
	r.wrong = _round_wrong
	r.helped = _round_helped or result.helped
	r.outcomes = result.outcomes
	r.multi_step = result.multi_step
	_results.append(r)
	_after_round()

func _after_round() -> void:
	var gen: int = _gen
	if _time_up:
		_remove_game()
		_complete(true, _pos + 1 < _queue.size())
		return
	if _pending_later:
		_pending_later = false
		await _say("vo.genel.sonra_tekrar")
		if _stale(gen):
			return
	await _pause()
	if _stale(gen):
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

## partial: süre dolduğu için kuyruk bitmeden duruldu; yalnızca ustalık kaydedilir.
func _complete(time_up: bool, partial: bool) -> void:
	_active = false
	_gen += 1
	var summary: Dictionary = {"stars": 0, "new_sticker": "", "unlocked": "", "new_decor": ""}
	if _review:
		if _any_played():
			summary = progress.record_review(_profile_id, _played_results(), partial)
	elif partial:
		if not _results.is_empty():
			progress.record_partial(_profile_id, _node_id, _results)
	elif _any_played():
		summary = progress.record_node(_profile_id, _node_id, _results)
	summary["node_id"] = _node_id
	summary["time_up"] = time_up
	summary["review"] = _review
	lesson_completed.emit(summary)

## En az bir tur gerçekten oynandı mı? (Hepsi atlandıysa yıldız/çıkartma/kilit açma yok.)
func _any_played() -> bool:
	for i: int in _results.size():
		if not _skipped.has(i):
			return true
	return false

## Atlanan turlar hariç sonuçlar (tekrar kaydı için).
func _played_results() -> Array[RoundResult]:
	var out: Array[RoundResult] = []
	for i: int in _results.size():
		if not _skipped.has(i):
			out.append(_results[i])
	return out
