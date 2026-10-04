extends Node
## Günlük süre sınırı, cihaz başına: bütün profillerin süresi tek sayaçta toplanır, profil
## değiştirerek sınır aşılamaz. Etkin gün = max(saat günü, last_day_seen); saat geri alınsa
## bile kullanım sıfırlanmaz. Ebeveyn kilidi açması yalnızca o güne geçerlidir. Saat ileri
## alınıp geri getirildiyse veli "günü sıfırla" ile etkin günü saate döndürür.

const DayReset: GDScript = preload("res://scripts/core/day_reset.gd")

signal limit_reached

## Birikmiş süre bu kadar saniyede bir diske yazılır.
const SAVE_INTERVAL_S: float = 15.0
## Bir karede sayılacak en uzun süre: askıdan dönüşteki dev kare süresi süreyi şişirmesin.
const MAX_FRAME_DELTA_S: float = 1.0

var clock: DayClock = DayClock.new()
## Testlerde değiştirilebilir; boşsa _ready'de autoload bağlanır.
var save: Node = null

var _started: bool = false
var _frac: float = 0.0
var _since_save: float = 0.0
## Sinyalin yayıldığı gün; aynı gün tekrar yayılmaz.
var _emitted_day: int = -1

func _ready() -> void:
	if save == null:
		save = get_node("/root/SaveService")

func _process(delta: float) -> void:
	if _started:
		tick(minf(delta, MAX_FRAME_DELTA_S))

## Arka plana geçerken ya da kapanırken birikmiş kullanımı diske yazar.
func _notification(what: int) -> void:
	if what == NOTIFICATION_APPLICATION_PAUSED or what == NOTIFICATION_WM_CLOSE_REQUEST:
		if _started and save != null:
			_since_save = 0.0
			save.save()

## Sayacı başlatır. Profil değişince sayaç sıfırlanmaz (sınır cihaz başınadır).
func start() -> void:
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
	var usage: Dictionary = _usage()
	_frac += delta_s
	var whole: int = int(_frac)
	_frac -= float(whole)
	usage["seconds"] = int(usage["seconds"]) + whole
	_since_save += delta_s
	if _since_save >= SAVE_INTERVAL_S:
		_since_save = 0.0
		save.save()
	if is_locked():
		var day: int = _effective_day()
		if _emitted_day != day:
			_emitted_day = day
			limit_reached.emit()

func is_locked() -> bool:
	var limit: int = _limit_min()
	if limit <= 0:
		return false
	var usage: Dictionary = _usage()
	if int(usage["unlocked_day"]) == _effective_day():
		return false
	return int(usage["seconds"]) >= limit * 60

## Sınır kapalıysa ya da bugünlük açıldıysa -1.
func remaining_seconds() -> int:
	var limit: int = _limit_min()
	var usage: Dictionary = _usage()
	if limit <= 0 or int(usage["unlocked_day"]) == _effective_day():
		return -1
	return maxi(0, limit * 60 - int(usage["seconds"]))

func parent_unlock_today() -> void:
	_usage()["unlocked_day"] = _effective_day()
	save.save()

## Veli "günü sıfırla": etkin gün saatin gösterdiği güne döner; gelecekte kalan
## kullanım, açma ve tekrar tarihleri bugüne çekilir (scripts/core/day_reset.gd).
func reset_day() -> void:
	DayReset.apply(save.data, clock.today())
	_emitted_day = -1
	save.save()

## Etkin gün saatin gününden ileride mi (saat ileri alınıp geri getirilmiş)?
func day_ahead() -> bool:
	return int(save.data.get("last_day_seen", 0)) > clock.today()

func _limit_min() -> int:
	return int(save.data["settings"].get("daily_limit_min", 0))

## last_day_seen asla azalmaz (yalnızca reset_day ile).
func _effective_day() -> int:
	var seen: int = int(save.data.get("last_day_seen", 0))
	var today: int = clock.today()
	if today > seen:
		save.data["last_day_seen"] = today
		seen = today
	return seen

## Cihazın kullanım kaydı; yeni güne geçildiyse sıfırlanmış halde döner.
func _usage() -> Dictionary:
	var day: int = _effective_day()
	if not (save.data.get("usage") is Dictionary):
		save.data["usage"] = SaveSchema.new_usage()
	var usage: Dictionary = save.data["usage"]
	if not usage.has("unlocked_day"):
		usage["unlocked_day"] = -1
	if int(usage.get("day", 0)) < day:
		usage["day"] = day
		usage["seconds"] = 0
	return usage
