extends RefCounted
## trace şablonunun saf mantığı: dik temel harf ve rakam iz yollarını (content/trace/glyphs.json)
## eşit aralıklı noktalara çevirir, birden çok glifi yan yana yerleştirir ve parmağın yolu
## izleyişini (Tracker) takip eder. Sahnesizdir; bütün koordinatlar glif birimindedir
## (y=0 üst çizgi, 1 orta çizgi, 2 taban çizgisi, 3 alt çizgi).

const GLYPHS_PATH: String = "res://content/trace/glyphs.json"
## Örnekleme aralığı (birim).
const SAMPLE_STEP: float = 0.05
## Yerleşimde glifler arası boşluk (birim).
const GLYPH_GAP: float = 0.45
## Dört çizgili bandın dikey sınırları: noktalar ve şapkalar üst çizginin üstüne taşabilir.
const BAND_TOP: float = -0.6
const BAND_BOTTOM: float = 3.1
## Yerleşimde dört çizginin (0..3) ve glif noktalarının çevresinde bırakılan pay (birim).
const LAYOUT_MARGIN: float = 0.2
const OPS: Dictionary = {"M": 2, "L": 2, "D": 2, "A": 6}

static var _cache: Dictionary = {}

## Bütün glifler (karakter -> {"strokes": [...]}); dosya bir kez okunur.
static func glyphs() -> Dictionary:
	if _cache.is_empty():
		var parsed: Variant = JSON.parse_string(FileAccess.get_file_as_string(GLYPHS_PATH))
		if parsed is Dictionary and (parsed as Dictionary).get("glyphs") is Dictionary:
			_cache = (parsed as Dictionary)["glyphs"]
		else:
			push_error("trace glifleri okunamadı: " + GLYPHS_PATH)
	return _cache

static func has_glyph(ch: String) -> bool:
	return glyphs().has(ch)

## Glif verisi biçimce geçerli mi? (Her vuruş M, A ya da tek başına D ile başlar.)
static func is_valid_glyph(g: Variant) -> bool:
	if not (g is Dictionary) or not ((g as Dictionary).get("strokes") is Array):
		return false
	var strokes: Array = (g as Dictionary)["strokes"]
	if strokes.is_empty():
		return false
	for s: Variant in strokes:
		if not (s is Array) or (s as Array).is_empty():
			return false
		var ops: Array = s as Array
		for i: int in ops.size():
			if not (ops[i] is Array) or (ops[i] as Array).is_empty():
				return false
			var op: Array = ops[i]
			var name: String = str(op[0])
			if not OPS.has(name) or op.size() != int(OPS[name]) + 1:
				return false
			for k: int in range(1, op.size()):
				if not (op[k] is float or op[k] is int):
					return false
			if i == 0 and name == "L":
				return false
			if i > 0 and (name == "M" or name == "D"):
				return false
			if name == "D" and ops.size() > 1:
				return false
	return true

## Bir vuruşun komutlarını eşit aralıklı noktalara çevirir.
## Yayın başlangıcı kalemin bulunduğu yerden uzaksa araya düz çizgi eklenir.
static func sample_stroke(ops: Array, step: float = SAMPLE_STEP) -> PackedVector2Array:
	var pts: PackedVector2Array = PackedVector2Array()
	for op_v: Variant in ops:
		var op: Array = op_v as Array
		match str(op[0]):
			"M", "D":
				pts.append(Vector2(float(op[1]), float(op[2])))
			"L":
				_line_to(pts, Vector2(float(op[1]), float(op[2])), step)
			"A":
				var c: Vector2 = Vector2(float(op[1]), float(op[2]))
				var r: Vector2 = Vector2(float(op[3]), float(op[4]))
				var a0: float = deg_to_rad(float(op[5]))
				var a1: float = deg_to_rad(float(op[6]))
				var start: Vector2 = c + Vector2(cos(a0), sin(a0)) * r
				if pts.is_empty():
					pts.append(start)
				else:
					_line_to(pts, start, step)
				var approx_len: float = absf(a1 - a0) * maxf(r.x, r.y)
				var n: int = maxi(6, ceili(approx_len / step))
				for i: int in range(1, n + 1):
					var a: float = lerpf(a0, a1, float(i) / n)
					pts.append(c + Vector2(cos(a), sin(a)) * r)
	return pts

static func _line_to(pts: PackedVector2Array, to: Vector2, step: float) -> void:
	if pts.is_empty():
		pts.append(to)
		return
	var from: Vector2 = pts[pts.size() - 1]
	var d: float = from.distance_to(to)
	if d < 0.001:
		return
	var n: int = maxi(1, ceili(d / step))
	for i: int in range(1, n + 1):
		pts.append(from.lerp(to, float(i) / n))

## Metindeki glifleri soldan sağa yerleştirir.
## Dönüş: {"strokes": Array[PackedVector2Array], "glyph_of": Array[int], "bounds": Rect2}.
## bounds yatayda gliflerin kapladığı alanı, dikeyde dört çizgiyi (0..3) ve taşan noktaları
## (küçük bir payla) kapsar.
static func layout(text: String) -> Dictionary:
	var strokes: Array[PackedVector2Array] = []
	var glyph_of: Array[int] = []
	var cursor: float = 0.0
	var gi: int = 0
	var min_y: float = 0.0
	var max_y: float = 3.0
	for ch: String in text:
		var g: Dictionary = glyphs().get(ch, {})
		var sampled: Array[PackedVector2Array] = []
		var min_x: float = INF
		var max_x: float = -INF
		for s: Variant in g.get("strokes", []):
			var pts: PackedVector2Array = sample_stroke(s as Array)
			sampled.append(pts)
			for p: Vector2 in pts:
				min_x = minf(min_x, p.x)
				max_x = maxf(max_x, p.x)
				min_y = minf(min_y, p.y)
				max_y = maxf(max_y, p.y)
		if sampled.is_empty():
			gi += 1
			continue
		var dx: float = cursor - min_x
		for pts: PackedVector2Array in sampled:
			var moved: PackedVector2Array = PackedVector2Array()
			for p: Vector2 in pts:
				moved.append(p + Vector2(dx, 0))
			strokes.append(moved)
			glyph_of.append(gi)
		cursor += (max_x - min_x) + GLYPH_GAP
		gi += 1
	var width: float = maxf(cursor - GLYPH_GAP, 0.0)
	var top: float = min_y - LAYOUT_MARGIN
	var bottom: float = max_y + LAYOUT_MARGIN
	return {"strokes": strokes, "glyph_of": glyph_of, "bounds": Rect2(0.0, top, width, bottom - top)}

## Bir vuruşun izlenişini takip eder. Parmak yolu yalnızca ileri doğru, yakın bir pencere
## içinde ilerletebilir (atlama ve ters yön ilerleme sayılmaz); pencereden çok uzaklaşmak
## "yoldan çıktı" demektir. İlerleme yoldan çıkınca da korunur (ceza yok).
class Tracker:
	extends RefCounted

	enum { ON, OFF, DONE }

	## Parmak ilerlemesinin bakabileceği en uzak yol mesafesi (birim).
	const LOOKAHEAD: float = 0.6
	const LOOKBACK: float = 0.6
	## Yoldan çıkma eşiği = tolerans × bu çarpan.
	const OFF_FACTOR: float = 1.8
	## Başlangıç noktasına (ve noktalara) dokunma payı = tolerans × bu çarpan.
	const START_FACTOR: float = 1.6
	## Bitişe bu kadar (tolerans × çarpan) yaklaşınca vuruş tamam sayılır.
	const END_FACTOR: float = 0.6

	var pts: PackedVector2Array
	var tol: float
	var progress: int = 0
	var done: bool = false
	var _cum: PackedFloat32Array = PackedFloat32Array()

	func _init(points: PackedVector2Array, tolerance: float) -> void:
		pts = points
		tol = tolerance
		var total: float = 0.0
		for i: int in pts.size():
			if i > 0:
				total += pts[i - 1].distance_to(pts[i])
			_cum.append(total)

	func is_dot() -> bool:
		return pts.size() == 1

	## Şu an devam edilecek nokta (başlangıç ya da kalınan yer).
	func anchor() -> Vector2:
		return pts[progress]

	func can_start(p: Vector2) -> bool:
		return not done and p.distance_to(anchor()) <= tol * START_FACTOR

	## 0..1 ilerleme oranı.
	func ratio() -> float:
		if done:
			return 1.0
		if pts.size() < 2 or _cum[_cum.size() - 1] <= 0.0:
			return 0.0
		return _cum[progress] / _cum[_cum.size() - 1]

	## Tek bir parmak konumu. ON: yolda, OFF: yoldan çıktı, DONE: vuruş bitti.
	func feed(p: Vector2) -> int:
		if done:
			return DONE
		if is_dot():
			if p.distance_to(pts[0]) <= tol * START_FACTOR:
				done = true
				return DONE
			return OFF if p.distance_to(pts[0]) > tol * START_FACTOR * OFF_FACTOR else ON
		var here: float = _cum[progress]
		var best: int = -1
		var near_d: float = INF
		var j: int = progress
		while j > 0 and here - _cum[j - 1] <= LOOKBACK:
			j -= 1
		while j < pts.size() and _cum[j] - here <= LOOKAHEAD:
			var d: float = p.distance_to(pts[j])
			near_d = minf(near_d, d)
			if j >= progress and d <= tol and j > best:
				best = j
			j += 1
		if near_d > tol * OFF_FACTOR:
			return OFF
		if best > progress:
			progress = best
		if _cum[_cum.size() - 1] - _cum[progress] <= tol * END_FACTOR:
			progress = pts.size() - 1
			done = true
			return DONE
		return ON

	## İki parmak konumu arasını küçük adımlarla besler (hızlı kaydırmada atlama olmasın).
	func feed_segment(from: Vector2, to: Vector2) -> int:
		var d: float = from.distance_to(to)
		var n: int = maxi(1, ceili(d / (tol * 0.5)))
		var res: int = ON
		for i: int in range(1, n + 1):
			res = feed(from.lerp(to, float(i) / n))
			if res != ON:
				return res
		return res
