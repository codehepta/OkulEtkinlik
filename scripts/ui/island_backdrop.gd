extends RefCounted
## Profil ekranlarının zemini: ada görseli bulanık ve açık örtülü (kartlar öne çıksın); görsel
## yoksa çayır yeşili geçişi. Profil seçme ve profil oluşturma aynı zemini kullanır.

const ISLAND_KEY: String = "map.island"
const BLUR_RADIUS: float = 6.0
const VEIL: Color = Color(1.0, 0.96, 0.88, 0.38)

## Zemini ve üstündeki perdeyi host'a ekler; zemin TextureRect'ini döndürür.
static func add_to(host: Control) -> TextureRect:
	var backdrop: TextureRect = TextureRect.new()
	backdrop.name = "Backdrop"
	backdrop.set_anchors_preset(Control.PRESET_FULL_RECT)
	backdrop.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	backdrop.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_COVERED
	backdrop.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var island: Texture2D = AssetRegistry.texture(ISLAND_KEY)
	if island != null:
		backdrop.texture = island
		var mat: ShaderMaterial = ShaderMaterial.new()
		mat.shader = _blur_shader()
		mat.set_shader_parameter("radius", BLUR_RADIUS)
		backdrop.material = mat
	else:
		backdrop.texture = ClayStyle.vertical_gradient(ClayStyle.MINT, ClayStyle.MEADOW)
	host.add_child(backdrop)
	var veil: ColorRect = ColorRect.new()
	veil.name = "Veil"
	veil.color = VEIL
	veil.set_anchors_preset(Control.PRESET_FULL_RECT)
	veil.mouse_filter = Control.MOUSE_FILTER_IGNORE
	host.add_child(veil)
	return backdrop

static func _blur_shader() -> Shader:
	var sh: Shader = Shader.new()
	sh.code = """shader_type canvas_item;
uniform float radius = 6.0;
void fragment() {
	vec2 px = TEXTURE_PIXEL_SIZE * radius;
	vec4 c = vec4(0.0);
	for (int x = -2; x <= 2; x++) {
		for (int y = -2; y <= 2; y++) {
			c += texture(TEXTURE, UV + vec2(float(x), float(y)) * px);
		}
	}
	COLOR = c / 25.0;
}
"""
	return sh
