shader_type canvas_item;
// Görselin dört kenarını saydamlığa eritir; arkadaki düz renkle dikişsiz birleşir.
// fade: kenardan içeri erime genişliği (görselin o eksendeki boyuna oranı).
uniform float fade = 0.06;

void fragment() {
	vec4 c = texture(TEXTURE, UV);
	vec2 d = min(UV, vec2(1.0) - UV) / fade;
	c.a *= clamp(min(d.x, d.y), 0.0, 1.0);
	COLOR = c;
}
