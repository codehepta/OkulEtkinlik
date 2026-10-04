extends PanelContainer
## Altyazı balonu: Narrator.subtitle_requested metnini gösterir.
## 1. sınıf + show_text_g1 kapalıyken gizli kalır; Türkçe TTS sesi yoksa her durumda görünür.

@onready var _label: Label = $Label

## Aktif profilin sınıfını döndürür (0 = bilinmiyor). Test için değiştirilebilir.
var grade_provider: Callable = func() -> int:
	var root: Node = (Engine.get_main_loop() as SceneTree).root
	if root.has_node("AppState"):
		return int(root.get_node("AppState").get("active_grade"))
	return 0

func _ready() -> void:
	visible = false
	Narrator.subtitle_requested.connect(_on_subtitle_requested)
	Narrator.line_finished.connect(_on_line_finished)

static func should_show(grade: int, show_text_g1: bool, silent: bool) -> bool:
	if silent:
		return true
	return not (grade == 1 and not show_text_g1)

func _on_subtitle_requested(text: String) -> void:
	var settings: Dictionary = SaveService.data.get("settings", {}) as Dictionary
	var show_g1: bool = bool(settings.get("show_text_g1", false))
	var grade: int = grade_provider.call() as int
	_label.text = text
	visible = should_show(grade, show_g1, Narrator.last_line_silent)

func _on_line_finished(_id: String) -> void:
	visible = false
