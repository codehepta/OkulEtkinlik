extends PanelContainer
## Altyazı balonu: Narrator.subtitle_requested metnini gösterir.
## 1. sınıf + show_text_g1 kapalıyken gizli kalır; Türkçe TTS sesi yoksa her durumda görünür.
## Satır bitince kısa bir beklemeden sonra, anlatım kesilince (stop) hemen gizlenir.
## Uygulamada tek örnek vardır: AppState ekranların üstündeki bir CanvasLayer'a takar.
## Görünüm: yuvarlak köşeli, yarı saydam, metne göre boyutlanan (en çok MAX_TEXT_WIDTH) balon.
## Konum ekrana göre: ekran subtitle_placement() ile "top", "bottom" ya da "hidden" döndürebilir
## (varsayılan "bottom"); ekranlar balonun şeridini (ClayStyle.SUBTITLE_BAND) boş bırakır.

## Satır bittikten sonra balonun ekranda kalma süresi (sn).
const LINGER_SECONDS: float = 0.8
const PLACEMENT_TOP: String = "top"
const PLACEMENT_BOTTOM: String = "bottom"
const PLACEMENT_HIDDEN: String = "hidden"
## Yazının en geniş satırı (px); üst köşe düğmeleri (128 px + 24 kenar) arasında kalır.
const MAX_TEXT_WIDTH: float = 1040.0
const FONT_SIZE: int = 40
## Balonun ekran kenarına uzaklığı (px).
const EDGE_MARGIN: float = 24.0
const PAD_X: float = 40.0
const PAD_Y: float = 18.0
const RADIUS: int = 36
const FADE_SECONDS: float = 0.15
## Andika'nın satır yüksekliği geniş: çok satırlı balon gereksiz uzamasın.
const LINE_SPACING: int = -10

@onready var _label: Label = $Label

## Aktif profilin sınıfını döndürür (0 = bilinmiyor). Test için değiştirilebilir.
var grade_provider: Callable = func() -> int:
	var root: Node = (Engine.get_main_loop() as SceneTree).root
	if root.has_node("AppState"):
		return int(root.get_node("AppState").get("active_grade"))
	return 0
## Balonun konumunu döndürür ("top" / "bottom" / "hidden"). Varsayılan: AppState'in
## o anki ekranı subtitle_placement() tanımlıyorsa onun cevabı, yoksa "bottom".
var placement_provider: Callable = func() -> String:
	var root: Node = (Engine.get_main_loop() as SceneTree).root
	var app: Node = root.get_node_or_null("AppState")
	if app == null:
		return PLACEMENT_BOTTOM
	var scene: Node = app.call("current_scene") as Node
	if is_instance_valid(scene) and scene.has_method("subtitle_placement"):
		return str(scene.call("subtitle_placement"))
	return PLACEMENT_BOTTOM
## Dinlenen anlatıcı; boşsa _ready'de Narrator autoload'u. Testlerde ağaca eklemeden önce atanır.
var narrator: Node = null
var linger_seconds: float = LINGER_SECONDS

var _hide_gen: int = 0
var _placement: String = PLACEMENT_BOTTOM
var _fit_gen: int = 0

func _ready() -> void:
	visible = false
	mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_theme_stylebox_override("panel", ClayStyle.bubble_box(RADIUS, PAD_X, PAD_Y))
	_label.add_theme_font_size_override("font_size", FONT_SIZE)
	_label.add_theme_color_override("font_color", ClayStyle.BUBBLE_TEXT)
	_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_label.add_theme_constant_override("line_spacing", LINE_SPACING)
	if narrator == null:
		narrator = Narrator
	narrator.subtitle_requested.connect(_on_subtitle_requested)
	narrator.line_finished.connect(_on_line_finished)
	narrator.line_stopped.connect(_on_line_stopped)

static func should_show(grade: int, show_text_g1: bool, silent: bool) -> bool:
	if silent:
		return true
	return not (grade == 1 and not show_text_g1)

## Son yerleşim ("top" / "bottom" / "hidden"; testler için).
func placement() -> String:
	return _placement

## Ekran değişip yeni ekran balonu istemiyorsa (veli paneli) ya da konum değiştiyse uyum sağlar.
func _process(_delta: float) -> void:
	if not visible:
		return
	var p: String = str(placement_provider.call())
	if p == PLACEMENT_HIDDEN:
		_placement = p
		visible = false
	elif p != _placement:
		_place(p)

func _on_subtitle_requested(text: String) -> void:
	_hide_gen += 1
	var settings: Dictionary = SaveService.data.get("settings", {}) as Dictionary
	var show_g1: bool = bool(settings.get("show_text_g1", false))
	var grade: int = grade_provider.call() as int
	_label.text = text
	var p: String = str(placement_provider.call())
	var show: bool = p != PLACEMENT_HIDDEN and should_show(grade, show_g1, bool(narrator.get("last_line_silent")))
	_placement = p
	if not show:
		visible = false
		return
	_place(p)
	if not visible:
		visible = true
		_fade_in()

## Metne göre boyutlanır ve şeride yerleşir (alt ya da üst orta). Genişlik ölçülen metinden,
## yükseklik kabın en küçük boyutundan gelir (kenara sabit, içe doğru büyür).
## Uzun metin satırlara dengeli bölünür (son satır tek kelime kalmasın).
func _place(p: String) -> void:
	_placement = p
	_label.custom_minimum_size = Vector2(text_width(_label.text), 0)
	anchor_left = 0.5
	anchor_right = 0.5
	offset_left = 0.0
	offset_right = 0.0
	grow_horizontal = Control.GROW_DIRECTION_BOTH
	if p == PLACEMENT_TOP:
		anchor_top = 0.0
		anchor_bottom = 0.0
		offset_top = EDGE_MARGIN
		offset_bottom = EDGE_MARGIN
		grow_vertical = Control.GROW_DIRECTION_END
	else:
		anchor_top = 1.0
		anchor_bottom = 1.0
		offset_top = -EDGE_MARGIN
		offset_bottom = -EDGE_MARGIN
		grow_vertical = Control.GROW_DIRECTION_BEGIN
	reset_size()
	_refit_next_frame()

## Kaydırmalı yazının yüksekliği, etiket son genişliğini aldıktan sonra kesinleşir:
## bir kare sonra boyu yeniden en küçüğe indirir (balon gereksiz uzun kalmasın).
func _refit_next_frame() -> void:
	_fit_gen += 1
	var gen: int = _fit_gen
	if not is_inside_tree():
		return
	await get_tree().process_frame
	if gen != _fit_gen or not visible:
		return
	var bottom: bool = _placement != PLACEMENT_TOP
	offset_top = -EDGE_MARGIN if bottom else EDGE_MARGIN
	offset_bottom = offset_top
	reset_size()

## Metnin balondaki satır genişliği (px): tek satıra sığıyorsa metin kadar,
## sığmıyorsa satır sayısına dengeli bölünmüş genişlik (en çok MAX_TEXT_WIDTH).
func text_width(text: String) -> float:
	var font: Font = _label.get_theme_font("font")
	var one_line: float = font.get_string_size(text, HORIZONTAL_ALIGNMENT_LEFT, -1, FONT_SIZE).x + 4.0
	if one_line <= MAX_TEXT_WIDTH:
		return ceilf(one_line)
	var line_h: float = font.get_height(FONT_SIZE)
	var lines: int = ceili(one_line / MAX_TEXT_WIDTH)
	var w: float = MAX_TEXT_WIDTH
	# Kelime kaydırma satır sayısını artırabilir: gerçek satır sayısına göre genişliği yeniden dengele.
	for i: int in 3:
		w = minf(MAX_TEXT_WIDTH, ceilf(one_line / float(lines) + float(FONT_SIZE) * 2.0))
		var wrapped: int = roundi(font.get_multiline_string_size(text, HORIZONTAL_ALIGNMENT_LEFT, w, FONT_SIZE).y / line_h)
		if wrapped <= lines:
			break
		lines = wrapped
	return w

func _fade_in() -> void:
	var settings: Dictionary = SaveService.data.get("settings", {}) as Dictionary
	if bool(settings.get("reduce_motion", false)) or not is_inside_tree():
		modulate.a = 1.0
		return
	modulate.a = 0.0
	create_tween().tween_property(self, "modulate:a", 1.0, FADE_SECONDS)

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
