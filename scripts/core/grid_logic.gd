extends RefCounted
## Kareli zemin (grid) şablonunun saf mantığı: hücre ayrıştırma, program yürütme,
## en kısa program (BFS), ayna hücresi, kod yolu, 4-bağlılık, yılan sırası ve şekil dönüşümleri
## (döndürme, büyütme; MAT.2.3.4 b).
## Sahnesizdir; şablon ve doğrulama `preload` ile kullanır. Koordinatlar [sütun, satır],
## 0 tabanlı, satır 0 en üstte.

const DIRS: Dictionary = {
	"up": Vector2i(0, -1),
	"down": Vector2i(0, 1),
	"left": Vector2i(-1, 0),
	"right": Vector2i(1, 0),
}
## Saat yönünde yön sırası (dönüş kartları için).
const FACING_ORDER: PackedStringArray = ["up", "right", "down", "left"]
## Göreli oklar: ileri git, sola dön, sağa dön (dönüş yerinde yapılır).
const RELATIVE_CARDS: PackedStringArray = ["forward", "turn_left", "turn_right"]
## Mutlak oklar: her kart bir hücre o yöne gider ve yönü ayarlar.
const ABSOLUTE_CARDS: PackedStringArray = ["up", "down", "left", "right"]

static func cards_for(arrows: String) -> PackedStringArray:
	return ABSOLUTE_CARDS if arrows == "absolute" else RELATIVE_CARDS

## [sütun, satır] dizisini hücreye çevirir; geçersizse null.
static func parse_cell(v: Variant) -> Variant:
	if not (v is Array) or (v as Array).size() != 2:
		return null
	var a: Array = v
	if not ContentValidator.is_int_like(a[0]) or not ContentValidator.is_int_like(a[1]):
		return null
	return Vector2i(int(a[0]), int(a[1]))

## Hücre listesi; dizi değilse ya da bir öğe geçersizse null.
static func parse_cells(v: Variant) -> Variant:
	if not (v is Array):
		return null
	var out: Array[Vector2i] = []
	for x: Variant in v as Array:
		var c: Variant = parse_cell(x)
		if not (c is Vector2i):
			return null
		out.append(c as Vector2i)
	return out

static func in_bounds(c: Vector2i, cols: int, rows: int) -> bool:
	return c.x >= 0 and c.y >= 0 and c.x < cols and c.y < rows

## Karakter bu hücreye girebilir mi (ızgara içi ve duvar değil)?
static func passable(c: Vector2i, cols: int, rows: int, walls: Dictionary) -> bool:
	return in_bounds(c, cols, rows) and not walls.has(c)

## Tek kartın etkisi (sınır denetimi yok): {"cell", "facing"}.
static func step(cell: Vector2i, facing: String, card: String) -> Dictionary:
	var i: int = FACING_ORDER.find(facing)
	match card:
		"forward":
			return {"cell": cell + (DIRS[facing] as Vector2i), "facing": facing}
		"turn_left":
			return {"cell": cell, "facing": FACING_ORDER[(i + 3) % 4]}
		"turn_right":
			return {"cell": cell, "facing": FACING_ORDER[(i + 1) % 4]}
	return {"cell": cell + (DIRS[card] as Vector2i), "facing": card}

## Programı yürütür. states: her başarılı karttan sonraki durum; blocked: ızgara dışı ya da
## duvar yüzünden durdu mu; blocked_facing: çarpma anındaki yön; end / end_facing: son durum.
static func simulate(program: Array, start: Vector2i, facing: String, cols: int, rows: int, walls: Dictionary) -> Dictionary:
	var states: Array[Dictionary] = []
	var cell: Vector2i = start
	var f: String = facing
	for card: Variant in program:
		var n: Dictionary = step(cell, f, str(card))
		var nc: Vector2i = n["cell"]
		if not passable(nc, cols, rows, walls):
			return {"states": states, "blocked": true, "blocked_facing": str(n["facing"]), "end": cell, "end_facing": f}
		cell = nc
		f = str(n["facing"])
		states.append(n)
	return {"states": states, "blocked": false, "blocked_facing": f, "end": cell, "end_facing": f}

static func _key(cell: Vector2i, facing: String, arrows: String) -> Vector3i:
	return Vector3i(cell.x, cell.y, 0 if arrows == "absolute" else FACING_ORDER.find(facing))

## En kısa program (BFS; göreli oklarda durum = hücre + yön, mutlakta yalnızca hücre).
## Başlangıç hedefse ya da hedefe ulaşılamıyorsa boş dizi döner (ayrım için is_reachable).
static func shortest_program(start: Vector2i, facing: String, goal: Vector2i, arrows: String, cols: int, rows: int, walls: Dictionary) -> Array[String]:
	var res: Array[String] = []
	var cards: PackedStringArray = cards_for(arrows)
	var k0: Vector3i = _key(start, facing, arrows)
	var prev: Dictionary = {k0: []}
	var queue: Array[Dictionary] = [{"cell": start, "facing": facing}]
	var head: int = 0
	while head < queue.size():
		var s: Dictionary = queue[head]
		head += 1
		var sc: Vector2i = s["cell"]
		var sf: String = s["facing"]
		var sk: Vector3i = _key(sc, sf, arrows)
		if sc == goal:
			var k: Vector3i = sk
			while not (prev[k] as Array).is_empty():
				var link: Array = prev[k]
				res.push_front(str(link[1]))
				k = link[0]
			return res
		for card: String in cards:
			var n: Dictionary = step(sc, sf, card)
			var nc: Vector2i = n["cell"]
			if not passable(nc, cols, rows, walls):
				continue
			var nk: Vector3i = _key(nc, str(n["facing"]), arrows)
			if prev.has(nk):
				continue
			prev[nk] = [sk, card]
			queue.append(n)
	return res

static func is_reachable(start: Vector2i, facing: String, goal: Vector2i, arrows: String, cols: int, rows: int, walls: Dictionary) -> bool:
	return start == goal or not shortest_program(start, facing, goal, arrows, cols, rows, walls).is_empty()

## Dikey eksene göre ayna: eksen axis-1 ile axis sütunları arasında.
static func mirror(c: Vector2i, axis: int) -> Vector2i:
	return Vector2i(2 * axis - 1 - c.x, c.y)

## Kodla boyama: başlangıç hücresi ve [yön, adım] komutlarıyla geçilen her hücre (tekrarsız, sırayla).
static func code_cells(start: Vector2i, code: Array) -> Array[Vector2i]:
	var res: Array[Vector2i] = [start]
	var cell: Vector2i = start
	for ins: Variant in code:
		var pair: Array = ins
		var d: Vector2i = DIRS[str(pair[0])]
		for i: int in int(pair[1]):
			cell += d
			if not res.has(cell):
				res.append(cell)
	return res

## Hücreler 4-bağlı tek parça mı? (Boş liste bağlı sayılmaz.)
static func cells_connected(cells: Array) -> bool:
	if cells.is_empty():
		return false
	var members: Dictionary = {}
	for c: Vector2i in cells:
		members[c] = true
	var seen: Dictionary = {cells[0]: true}
	var queue: Array[Vector2i] = [cells[0] as Vector2i]
	var head: int = 0
	while head < queue.size():
		var c: Vector2i = queue[head]
		head += 1
		for d: Vector2i in DIRS.values():
			var n: Vector2i = c + d
			if members.has(n) and not seen.has(n):
				seen[n] = true
				queue.append(n)
	return seen.size() == members.size()

## Sol üstten yılan sırası (satır 0 soldan sağa, satır 1 sağdan sola ...): ilk n hücre bağlıdır.
static func snake_cells(cols: int, rows: int, n: int) -> Array[Vector2i]:
	var res: Array[Vector2i] = []
	for r: int in rows:
		for i: int in cols:
			if res.size() >= n:
				return res
			res.append(Vector2i(i if r % 2 == 0 else cols - 1 - i, r))
	return res

## Satır öncelikli sıralı kopya.
static func sorted_cells(cells: Array) -> Array[Vector2i]:
	var res: Array[Vector2i] = []
	for c: Vector2i in cells:
		res.append(c)
	res.sort_custom(func(a: Vector2i, b: Vector2i) -> bool: return a.y < b.y or (a.y == b.y and a.x < b.x))
	return res

## Şekli sol üst köşesi (0, 0) olacak biçimde kaydırır; satır öncelikli sıralı.
static func normalized(cells: Array) -> Array[Vector2i]:
	var res: Array[Vector2i] = []
	if cells.is_empty():
		return res
	var mn: Vector2i = cells[0]
	for c: Vector2i in cells:
		mn = Vector2i(mini(mn.x, c.x), mini(mn.y, c.y))
	for c: Vector2i in cells:
		res.append(c - mn)
	return sorted_cells(res)

## Saat yönünde çeyrek dönüş (satır 0 üstte): sağa uzanan kol aşağı iner. Sonuç normalizedir.
static func rotated(cells: Array) -> Array[Vector2i]:
	var res: Array[Vector2i] = []
	for c: Vector2i in cells:
		res.append(Vector2i(-c.y, c.x))
	return normalized(res)

## Her kare 2×2 olacak biçimde iki kat büyütme. Sonuç normalizedir.
static func scaled(cells: Array) -> Array[Vector2i]:
	var res: Array[Vector2i] = []
	for c: Vector2i in normalized(cells):
		for d: Vector2i in [Vector2i(0, 0), Vector2i(1, 0), Vector2i(0, 1), Vector2i(1, 1)]:
			res.append(c * 2 + d)
	return sorted_cells(res)

## Dönüşümün kabul ettiği şekiller (normalize). rotate: 90°, 180° ve 270° dönmüş biçimlerden örnekle
## aynı yönde olmayanlar (dönünce değişmeyen şekilde boş); scale: iki kat büyümüş biçim.
static func transform_shapes(reference: Array, kind: String) -> Array:
	var res: Array = []
	var ref: Array[Vector2i] = normalized(reference)
	if kind == "scale":
		res.append(scaled(ref))
	elif kind == "rotate":
		var cur: Array[Vector2i] = ref
		for i: int in 3:
			cur = rotated(cur)
			if cur != ref and not res.has(cur):
				res.append(cur)
	return res

## Boyanan hücreler, örneğin dönüşmüş biçimlerinden biri mi (konum serbest)?
static func matches_transform(cells: Array, reference: Array, kind: String) -> bool:
	return not cells.is_empty() and transform_shapes(reference, kind).has(normalized(cells))
