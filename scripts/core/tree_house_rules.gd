class_name TreeHouseRules
## Bilge'nin Ağaç Evi kuralları (spec §3.5): toplam yıldız eşiklerinde süs eşyası açılır.
## Eşikler 5, 15, 30, sonra 20'şer artar. Saf mantık, sahnesiz.

const FIRST_THRESHOLDS: Array[int] = [5, 15, 30]
const STEP_AFTER: int = 20
const DEFAULT_PATH: String = "res://content/tree_house.json"

## i. (0'dan) süs eşyasının açıldığı toplam yıldız.
static func threshold(i: int) -> int:
	if i < FIRST_THRESHOLDS.size():
		return FIRST_THRESHOLDS[maxi(i, 0)]
	return FIRST_THRESHOLDS[-1] + (i - FIRST_THRESHOLDS.size() + 1) * STEP_AFTER

## Bu kadar yıldızla açılmış süs sayısı (katalog boyutuyla sınırlı).
static func unlocked_count(stars: int, item_count: int) -> int:
	var n: int = 0
	while n < item_count and stars >= threshold(n):
		n += 1
	return n

## content/tree_house.json içindeki süs anahtarları, açılma sırasıyla.
static func load_items(path: String = DEFAULT_PATH) -> PackedStringArray:
	var parsed: Variant = JSON.parse_string(FileAccess.get_file_as_string(path))
	if parsed is Dictionary and (parsed as Dictionary).get("items") is Array:
		return PackedStringArray((parsed as Dictionary)["items"])
	push_error("Ağaç evi kataloğu okunamadı: " + path)
	return PackedStringArray()

## Oda içindeki konumu 0–1 aralığına sıkıştırır.
static func clamp_pos(pos: Vector2) -> Vector2:
	return Vector2(clampf(pos.x, 0.0, 1.0), clampf(pos.y, 0.0, 1.0))
