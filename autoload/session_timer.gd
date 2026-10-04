extends Node
## Günlük süre sınırı. Etkin gün = max(saat günü, last_day_seen); saat geri alınsa
## bile kullanım sıfırlanmaz. Ebeveyn kilidi açması yalnızca o güne geçerlidir.

signal limit_reached

## Birikmiş süre bu kadar saniyede bir diske yazılır.
const SAVE_INTERVAL_S: float = 15.0

var clock: DayClock = DayClock.new()
## Testlerde değiştirilebilir; boşsa _ready'de autoload bağlanır.
var save: Node = null

var _profile_id: String = ""
var _started: bool = false
var _frac: float = 0.0
var _since_save: float = 0.0
## Sinyalin yayıldığı (profil, gün) anahtarı; aynı gün tekrar yayılmaz.
var _emitted_key: String = ""

func _ready() -> void:
	if save == null:
		save = get_node("/root/SaveService")

func _process(delta: float) -> void:
	if _started:
		tick(delta)

func start(profile_id: String) -> void:
	_profile_id = profile_id
	_started = true
	_frac = 0.0
	_since_save = 0.0

func stop() -> void:
	if _started:
		_started = false
		save.save()

func tick(delta_s: float) -> void:
	if not _started:
		return
	var usage: Dictionary = _usage(_profile_id)
	if usage.is_empty():
		return
	_frac += delta_s
	var whole: int = int(_frac)
	_frac -= float(whole)
	usage["seconds"] = int(usage["seconds"]) + whole
	_since_save += delta_s
	if _since_save >= SAVE_INTERVAL_S:
		_since_save = 0.0
		save.save()
	if is_locked(_profile_id):
		var key: String = "%s@%d" % [_profile_id, _effective_day()]
		if _emitted_key != key:
			_emitted_key = key
			limit_reached.emit()

func is_locked(profile_id: String) -> bool:
	var limit: int = _limit_min()
	if limit <= 0:
		return false
	var usage: Dictionary = _usage(profile_id)
	if usage.is_empty() or int(usage["unlocked_day"]) == _effective_day():
		return false
	return int(usage["seconds"]) >= limit * 60

## Sınır kapalıysa ya da bugünlük açıldıysa -1.
func remaining_seconds(profile_id: String) -> int:
	var limit: int = _limit_min()
	var usage: Dictionary = _usage(profile_id)
	if limit <= 0 or usage.is_empty() or int(usage["unlocked_day"]) == _effective_day():
		return -1
	return maxi(0, limit * 60 - int(usage["seconds"]))

func parent_unlock_today(profile_id: String) -> void:
	var usage: Dictionary = _usage(profile_id)
	if usage.is_empty():
		return
	usage["unlocked_day"] = _effective_day()
	save.save()

func _limit_min() -> int:
	return int(save.data["settings"].get("daily_limit_min", 0))

## last_day_seen asla azalmaz.
func _effective_day() -> int:
	var seen: int = int(save.data.get("last_day_seen", 0))
	var today: int = clock.today()
	if today > seen:
		save.data["last_day_seen"] = today
		seen = today
	return seen

## Profilin kullanım kaydı; yeni güne geçildiyse sıfırlanmış halde döner.
func _usage(profile_id: String) -> Dictionary:
	var day: int = _effective_day()
	for p: Variant in save.data["profiles"]:
		var d: Dictionary = p
		if str(d.get("id", "")) != profile_id:
			continue
		var usage: Dictionary = d["usage"]
		if not usage.has("unlocked_day"):
			usage["unlocked_day"] = -1
		if int(usage.get("day", 0)) < day:
			usage["day"] = day
			usage["seconds"] = 0
		return usage
	return {}
