extends Control
## Profil seçimi ("Kim oynuyor?"): açılıştaki ada görseli yumuşatılmış zemin olarak sürer; üstte
## Bilge başlık plaketini gösterir. En fazla 4 avatar kartı (kil madalyonda avatar, kurdelede ad),
## "+ Yeni" kartı (4 profilde gizli), sağ altta veli dişlisi. Kartlar sırayla gelir; dokunulan kart
## kısa bir zıplamadan sonra açılır. "Hareketi azalt" açıkken animasyon yoktur.

const IslandBackdrop: GDScript = preload("res://scripts/ui/island_backdrop.gd")
const BILGE_KEY: String = "char.bilge.point_right"
const BILGE_SIZE: Vector2 = Vector2(200, 232)
const TITLE_FONT_SIZE: int = 84
const CARD_SIZE: Vector2 = Vector2(340, 460)
const MEDAL_SIZE: Vector2 = Vector2(292, 292)
const MEDAL_PAD: float = 14.0
const NAME_FONT_SIZE: int = 44
const CARD_COLOR: Color = ClayStyle.APRICOT
const PLUS_COLOR: Color = ClayStyle.MINT
const PLUS_DISC: Vector2 = Vector2(220, 220)
const PLUS_LIFT: float = 22.0
## Zemin bulanıklığı (kaynak piksel) ve üstündeki açık örtü.
const CARDS_TOP: float = 280.0
const ENTER_SECONDS: float = 0.45
const ENTER_STAGGER: float = 0.09
const BOUNCE_SECONDS: float = 0.22

var app: Node = AppState

var _cards: Array[Button] = []
var _plus: Button = null
var _plus_caption: Label = null
var _title: Label = null
var _backdrop: TextureRect = null
var _bilge: Control = null
var _navigating: bool = false

func _ready() -> void:
	_build_backdrop()
	_build_header()

	# Kartlar başlığın altında ortada, kendi boylarında; altta altyazı şeridi boş kalır.
	var center: CenterContainer = CenterContainer.new()
	center.set_anchors_preset(Control.PRESET_FULL_RECT)
	center.offset_top = CARDS_TOP
	center.offset_bottom = -ClayStyle.SUBTITLE_BAND / 2.0
	add_child(center)
	var row: HBoxContainer = HBoxContainer.new()
	row.alignment = BoxContainer.ALIGNMENT_CENTER
	row.add_theme_constant_override("separation", 48)
	center.add_child(row)

	var profiles: Array[Dictionary] = app.progress.profiles()
	for p: Dictionary in profiles:
		var card: Button = _make_card(str(p["avatar"]), _display_name(p))
		var id: String = str(p["id"])
		card.pressed.connect(_on_card_pressed.bind(id, card))
		row.add_child(card)
		_cards.append(card)

	_plus = _make_plus_card()
	_plus.pressed.connect(func() -> void: app.goto("profile_create"))
	_plus.visible = profiles.size() < app.progress.MAX_PROFILES
	row.add_child(_plus)

	var replay: Button = (load("res://scenes/components/replay_voice_button.tscn") as PackedScene).instantiate() as Button
	replay.position = Vector2(24, 24)
	add_child(replay)

	var gear: Button = (load("res://scenes/components/big_button.tscn") as PackedScene).instantiate() as Button
	gear.set("icon_key", "ui.parent")
	gear.set("clay_color", ClayStyle.SKY)
	gear.set_anchors_preset(Control.PRESET_BOTTOM_RIGHT)
	gear.offset_left = -152.0
	gear.offset_top = -152.0
	gear.offset_right = -24.0
	gear.offset_bottom = -24.0
	gear.pressed.connect(open_parent_gate)
	add_child(gear)

	app.narrator.say("vo.genel.profil_sec")
	_play_enter.call_deferred()

## Altyazı balonu altta: kartlar ortada, dişli sağ altta (balon onlara değmez).
func subtitle_placement() -> String:
	return "bottom"

func profile_cards() -> Array[Button]:
	return _cards

func plus_card() -> Button:
	return _plus

func plus_caption() -> Label:
	return _plus_caption

func title_label() -> Label:
	return _title

func backdrop() -> TextureRect:
	return _backdrop

func bilge_view() -> Control:
	return _bilge

func _animate() -> bool:
	return not app.reduce_motion() and app.anim_scale > 0.0

## Dokunulan kart kısa bir zıplama yapar, sonra profil açılır.
func _on_card_pressed(id: String, card: Button) -> void:
	if _navigating:
		return
	app.audio.play_sfx("sfx.tap")
	if not _animate():
		select(id)
		return
	card.pivot_offset = card.size / 2.0
	var t: float = BOUNCE_SECONDS * app.anim_scale
	var tw: Tween = create_tween()
	tw.tween_property(card, "scale", Vector2(1.12, 1.12), t * 0.45).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	tw.tween_property(card, "scale", Vector2.ONE, t * 0.55).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	tw.tween_callback(select.bind(id))

func select(id: String) -> void:
	if _navigating:
		return
	_navigating = true
	app.select_profile(id)
	app.enter_after_profile()

func open_parent_gate() -> void:
	app.goto("parent_gate", {"next": {"scene": "parent_panel", "args": {}}})

func _display_name(p: Dictionary) -> String:
	var nick: String = str(p.get("nickname", ""))
	if nick != "":
		return nick
	var key: String = "label." + str(p["avatar"])
	return Strings.t(key) if Strings.has(key) else ""

## Zemin: ada görseli bulanık ve açık örtülü (ortak yardımcı: scripts/ui/island_backdrop.gd).
func _build_backdrop() -> void:
	_backdrop = IslandBackdrop.add_to(self)

## Üstte ortada: işaret eden Bilge + "Kim oynuyor?" kil plaketi.
func _build_header() -> void:
	var header: HBoxContainer = HBoxContainer.new()
	header.name = "Header"
	header.set_anchors_preset(Control.PRESET_CENTER_TOP)
	header.grow_horizontal = Control.GROW_DIRECTION_BOTH
	header.offset_top = 28.0
	header.alignment = BoxContainer.ALIGNMENT_CENTER
	header.add_theme_constant_override("separation", 12)
	header.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(header)
	_bilge = (load("res://scenes/components/asset_image.tscn") as PackedScene).instantiate() as Control
	_bilge.name = "Bilge"
	_bilge.set("key", BILGE_KEY)
	_bilge.mouse_filter = Control.MOUSE_FILTER_IGNORE
	header.add_child(_bilge)
	_bilge.custom_minimum_size = BILGE_SIZE
	var plaque: PanelContainer = PanelContainer.new()
	plaque.name = "TitlePlaque"
	plaque.add_theme_stylebox_override("panel", ClayStyle.title_plaque_box(56.0))
	plaque.mouse_filter = Control.MOUSE_FILTER_IGNORE
	plaque.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	header.add_child(plaque)
	_title = Label.new()
	_title.name = "Title"
	_title.text = Strings.t("profile.title")
	_title.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_title.add_theme_font_size_override("font_size", TITLE_FONT_SIZE)
	_title.add_theme_color_override("font_color", ClayStyle.TITLE_INK)
	_title.add_theme_color_override("font_shadow_color", Color(1, 1, 1, 0.55))
	_title.add_theme_constant_override("shadow_offset_x", 0)
	_title.add_theme_constant_override("shadow_offset_y", 3)
	ClayStyle.use_bold(_title)
	plaque.add_child(_title)
	# Başlık ekranın ortasında kalsın: Bilge kadar boşluk sağa da konur.
	var balance: Control = Control.new()
	balance.custom_minimum_size = Vector2(BILGE_SIZE.x, 0)
	balance.mouse_filter = Control.MOUSE_FILTER_IGNORE
	header.add_child(balance)

## Kartlar sırayla belirir (hafif büyüyerek); hareket azaltılmışsa hemen son hâliyle.
func _play_enter() -> void:
	if not is_inside_tree() or not _animate():
		return
	var list: Array[Button] = _cards.duplicate()
	if _plus.visible:
		list.append(_plus)
	for i: int in list.size():
		var c: Button = list[i]
		c.pivot_offset = c.size / 2.0
		c.modulate.a = 0.0
		c.scale = Vector2(0.85, 0.85)
		var tw: Tween = create_tween().set_parallel(true)
		var d: float = ENTER_STAGGER * i * app.anim_scale
		tw.tween_property(c, "modulate:a", 1.0, ENTER_SECONDS * 0.6 * app.anim_scale).set_delay(d)
		tw.tween_property(c, "scale", Vector2.ONE, ENTER_SECONDS * app.anim_scale).set_delay(d).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)

## Avatar kartı: kremsi kil madalyonda avatar, altında fildişi kurdelede ad.
func _make_card(avatar_key: String, caption: String) -> Button:
	var card: Button = _card_button(CARD_COLOR)
	var col: VBoxContainer = _card_column(card)
	var holder: CenterContainer = CenterContainer.new()
	holder.mouse_filter = Control.MOUSE_FILTER_IGNORE
	col.add_child(holder)
	var medal: Panel = Panel.new()
	medal.custom_minimum_size = MEDAL_SIZE
	medal.mouse_filter = Control.MOUSE_FILTER_IGNORE
	medal.add_theme_stylebox_override("panel", ClayStyle.box(ClayStyle.CREAM, int(MEDAL_SIZE.x / 2.0)))
	holder.add_child(medal)
	var img: Control = (load("res://scenes/components/asset_image.tscn") as PackedScene).instantiate() as Control
	img.set("key", avatar_key)
	img.mouse_filter = Control.MOUSE_FILTER_IGNORE
	medal.add_child(img)
	img.set_anchors_preset(Control.PRESET_FULL_RECT)
	img.offset_left = MEDAL_PAD
	img.offset_top = MEDAL_PAD
	img.offset_right = -MEDAL_PAD
	img.offset_bottom = -MEDAL_PAD - float(ClayStyle.DEPTH)
	if caption != "":
		col.add_child(_ribbon(caption))
	return card

## Ad kurdelesi: fildişi kil şerit, kalın koyu yazı; uzun takma ad kartı taşırmaz (üç nokta).
func _ribbon(caption: String) -> Control:
	var holder: CenterContainer = CenterContainer.new()
	holder.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var ribbon: PanelContainer = PanelContainer.new()
	ribbon.mouse_filter = Control.MOUSE_FILTER_IGNORE
	ribbon.add_theme_stylebox_override("panel", ClayStyle.plaque_box(ClayStyle.IVORY, ClayStyle.CLAY_EDGE, 26, 4, 4, 0, 24.0, 2.0))
	holder.add_child(ribbon)
	var label: Label = Label.new()
	label.text = caption
	label.add_theme_font_size_override("font_size", NAME_FONT_SIZE)
	label.add_theme_color_override("font_color", ClayStyle.INK)
	label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	label.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	label.mouse_filter = Control.MOUSE_FILTER_IGNORE
	ClayStyle.use_bold(label)
	var font: Font = label.get_theme_font("font")
	var width: float = font.get_string_size(caption, HORIZONTAL_ALIGNMENT_LEFT, -1, NAME_FONT_SIZE).x if font != null else 0.0
	label.custom_minimum_size = Vector2(minf(ceilf(width) + 2.0, CARD_SIZE.x - 96.0), 0)
	ribbon.add_child(label)
	return holder

## "+" kartı: nane yeşili kart üstünde kabarık bej kil disk ve büyük artı.
func _make_plus_card() -> Button:
	var card: Button = _card_button(PLUS_COLOR)
	var col: VBoxContainer = _card_column(card)
	var holder: CenterContainer = CenterContainer.new()
	holder.mouse_filter = Control.MOUSE_FILTER_IGNORE
	col.add_child(holder)
	var disc: Panel = Panel.new()
	disc.custom_minimum_size = PLUS_DISC
	disc.mouse_filter = Control.MOUSE_FILTER_IGNORE
	disc.add_theme_stylebox_override("panel", ClayStyle.box(ClayStyle.CREAM, int(PLUS_DISC.x / 2.0)))
	holder.add_child(disc)
	var plus: Label = Label.new()
	plus.text = Strings.t("profile.add")
	plus.add_theme_font_size_override("font_size", 160)
	plus.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	plus.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	plus.set_anchors_preset(Control.PRESET_FULL_RECT)
	# Andika'da "+" yazı çizgisinin altında durur: diskin ortasına gelsin diye biraz yukarı.
	plus.offset_top = -PLUS_LIFT
	plus.offset_bottom = -float(ClayStyle.DEPTH) - PLUS_LIFT
	plus.mouse_filter = Control.MOUSE_FILTER_IGNORE
	disc.add_child(plus)
	_plus_caption = Label.new()
	_plus_caption.text = Strings.t("profile.new")
	_plus_caption.add_theme_font_size_override("font_size", NAME_FONT_SIZE)
	_plus_caption.add_theme_color_override("font_color", ClayStyle.INK)
	_plus_caption.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_plus_caption.mouse_filter = Control.MOUSE_FILTER_IGNORE
	ClayStyle.use_bold(_plus_caption)
	col.add_child(_plus_caption)
	return card

func _card_button(color: Color) -> Button:
	var card: Button = Button.new()
	card.custom_minimum_size = CARD_SIZE
	card.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	card.focus_mode = Control.FOCUS_NONE
	ClayStyle.style_button(card, color, 36)
	return card

func _card_column(card: Button) -> VBoxContainer:
	var col: VBoxContainer = VBoxContainer.new()
	col.set_anchors_preset(Control.PRESET_FULL_RECT)
	col.offset_bottom = -float(ClayStyle.DEPTH)
	col.alignment = BoxContainer.ALIGNMENT_CENTER
	col.add_theme_constant_override("separation", 8)
	col.mouse_filter = Control.MOUSE_FILTER_IGNORE
	card.add_child(col)
	return col
