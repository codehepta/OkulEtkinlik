extends PanelContainer
## Altyazı balonu: Narrator.subtitle_requested metnini gösterir.
## 1. sınıf + show_text_g1 kapalıyken gizli kalır; Türkçe TTS sesi yoksa her durumda görünür.
## Satır bitince kısa bir beklemeden sonra, anlatım kesilince (stop) hemen gizlenir.
## Uygulamada tek örnek vardır: AppState ekranların üstündeki bir CanvasLayer'a takar.

## Satır bittikten sonra balonun ekranda kalma süresi (sn).
const LINGER_SECONDS: float = 0.8

@onready var _label: Label = $Label

## Aktif profilin sınıfını döndürür (0 = bilinmiyor). Test için değiştirilebilir.
var grade_provider: Callable = func() -> int:
	var root: Node = (Engine.get_main_loop() as SceneTree).root
	if root.has_node("AppState"):
		return int(root.get_node("AppState").get("active_grade"))
	return 0
## Dinlenen anlatıcı; boşsa _ready'de Narrator autoload'u. Testlerde ağaca eklemeden önce atanır.
var narrator: Node = null
var linger_seconds: float = LINGER_SECONDS

var _hide_gen: int = 0

func _ready() -> void:
	visible = false
	if narrator == null:
		narrator = Narrator
	narrator.subtitle_requested.connect(_on_subtitle_requested)
	narrator.line_finished.connect(_on_line_finished)
	narrator.line_stopped.connect(_on_line_stopped)

static func should_show(grade: int, show_text_g1: bool, silent: bool) -> bool:
	if silent:
		return true
	return not (grade == 1 and not show_text_g1)

func _on_subtitle_requested(text: String) -> void:
	_hide_gen += 1
	var settings: Dictionary = SaveService.data.get("settings", {}) as Dictionary
	var show_g1: bool = bool(settings.get("show_text_g1", false))
	var grade: int = grade_provider.call() as int
	_label.text = text
	visible = should_show(grade, show_g1, bool(narrator.get("last_line_silent")))

func _on_line_finished(_id: String) -> void:
	_hide_gen += 1
	var gen: int = _hide_gen
	if linger_seconds <= 0.0 or not is_inside_tree():
		visible = false
		return
	await get_tree().create_timer(linger_seconds).timeout
	if gen == _hide_gen:
		visible = false

func _on_line_stopped() -> void:
	_hide_gen += 1
	visible = false
