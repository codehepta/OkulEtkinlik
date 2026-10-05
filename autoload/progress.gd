extends Node
## Profil ilerlemesi: profiller, durak kilitleri, yıldız, ustalık, Leitner, çıkartma.
## Saf hesaplar Mastery/Leitner/Stars sınıflarındadır; burası kayıt verisini günceller.

const MAX_PROFILES: int = 4
const ReviewPicker: GDScript = preload("res://scripts/core/review_picker.gd")
## Tekrar Bulutu'nun giriş satırı.
const REVIEW_INTRO_VOICE: String = "vo.genel.tekrar_giris"

var clock: DayClock = DayClock.new()
## Testlerde değiştirilebilir; boşsa _ready'de autoload'lar bağlanır.
var save: Node = null
var content: Node = null
## Ağaç evi kataloğu; testlerde değiştirilebilir.
var decor_path: String = TreeHouseRules.DEFAULT_PATH

var _decor_items: PackedStringArray = PackedStringArray()
var _decor_loaded: bool = false

func _ready() -> void:
	if save == null:
		save = get_node("/root/SaveService")
	if content == null:
		content = get_node("/root/ContentDB")

func create_profile(avatar: String, nickname: String, grade: int) -> String:
	var list: Array = _profiles()
	if list.size() >= MAX_PROFILES:
		return ""
	var n: int = 1
	while _find("p%d" % n) >= 0:
		n += 1
	var id: String = "p%d" % n
	var p: Dictionary = SaveSchema.new_profile(id, avatar, nickname, grade)
	p["created_day"] = clock.today()
	list.append(p)
	save.save()
	return id

func delete_profile(id: String) -> void:
	var i: int = _find(id)
	if i >= 0:
		_profiles().remove_at(i)
		save.save()

func profiles() -> Array[Dictionary]:
	var out: Array[Dictionary] = []
	for p: Variant in _profiles():
		out.append(p)
	return out

func set_grade(id: String, grade: int) -> void:
	var p: Dictionary = _profile(id)
	if p.is_empty():
		return
	p["grade"] = grade
	save.save()

## "locked" | "open" | "done". Bir dersin ilk durağı açıktır.
func node_state(profile_id: String, node_id: String) -> String:
	var p: Dictionary = _profile(profile_id)
	var parts: PackedStringArray = node_id.split(".")
	if p.is_empty() or parts.size() < 4 or content.node(node_id).is_empty():
		return "locked"
	if best_stars(profile_id, node_id) > 0:
		return "done"
	var seq: Array[String] = _sequence(parts[0], parts[1])
	var i: int = seq.find(node_id)
	if i < 0:
		return "locked"
	if i == 0 or best_stars(profile_id, seq[i - 1]) > 0:
		return "open"
	return "locked"

func best_stars(profile_id: String, node_id: String) -> int:
	var nodes: Dictionary = _profile(profile_id).get("nodes", {})
	var e: Variant = nodes.get(node_id)
	return int((e as Dictionary).get("best_stars", 0)) if e is Dictionary else 0

## Profilin kazandığı çıkartma anahtarları (kazanma sırasıyla).
func stickers(profile_id: String) -> PackedStringArray:
	return PackedStringArray(_profile(profile_id).get("stickers", []))

func outcome_mastery(profile_id: String, code: String) -> float:
	var outs: Dictionary = _profile(profile_id).get("outcomes", {})
	var e: Variant = outs.get(code)
	return float((e as Dictionary).get("mastery", 0.0)) if e is Dictionary else 0.0

## Çıktının ustalık kaydının kopyası ({"mastery", "n", "adj", ...}); hiç oynanmadıysa {}.
## LessonRunner durak içinde zorluğu bu kopya üzerinde canlı günceller.
func outcome_record(profile_id: String, code: String) -> Dictionary:
	var outs: Dictionary = _profile(profile_id).get("outcomes", {})
	var e: Variant = outs.get(code)
	return (e as Dictionary).duplicate() if e is Dictionary else {}

func record_node(profile_id: String, node_id: String, results: Array[RoundResult]) -> Dictionary:
	var out: Dictionary = {"stars": 0, "new_sticker": "", "unlocked": "", "new_decor": ""}
	var p: Dictionary = _profile(profile_id)
	if p.is_empty():
		return out
	var stars: int = _stars_of(results)
	out["stars"] = stars
	var unlocked_before: int = decor_unlocked(profile_id).size()
	var nodes: Dictionary = p["nodes"]
	var entry: Dictionary = nodes.get(node_id, {"best_stars": 0, "plays": 0})
	var first_time: bool = int(entry.get("plays", 0)) == 0
	entry["best_stars"] = maxi(int(entry.get("best_stars", 0)), stars)
	entry["plays"] = int(entry.get("plays", 0)) + 1
	nodes[node_id] = entry
	_apply_outcomes(p, results, stars, true)

	if first_time:
		var sticker: String = str(content.node(node_id).get("sticker", ""))
		var owned: Array = p["stickers"]
		if not sticker.is_empty() and not owned.has(sticker):
			owned.append(sticker)
			out["new_sticker"] = sticker
	var unlocked_now: PackedStringArray = decor_unlocked(profile_id)
	if unlocked_now.size() > unlocked_before:
		out["new_decor"] = unlocked_now[unlocked_now.size() - 1]
	out["unlocked"] = content.next_node_id(node_id)
	save.save()
	return out

## Süre dolduğunda yarım kalan ders: yalnızca oynanan turların ustalığı işlenir.
## Yıldız, oynama sayısı, çıkartma, kilit ve Leitner'e dokunulmaz.
func record_partial(profile_id: String, node_id: String, results: Array[RoundResult]) -> void:
	var p: Dictionary = _profile(profile_id)
	if p.is_empty() or content.node(node_id).is_empty():
		return
	_apply_outcomes(p, results, 0, false)
	save.save()

## Tekrar Bulutu sonucu: ustalık ve Leitner duraktaki kuralla işlenir (≥2 yıldız bir kutu
## ilerletir, yardımlı tur 1. kutuya döndürür, aksi halde vade korunur). Düğüm yıldızı,
## çıkartma ve kilit yoktur; yıldız yalnızca sonuç ekranı içindir. partial: süre doldu,
## yalnızca ustalık işlenir.
func record_review(profile_id: String, results: Array[RoundResult], partial: bool = false) -> Dictionary:
	var out: Dictionary = {"stars": 0, "new_sticker": "", "unlocked": "", "new_decor": ""}
	var p: Dictionary = _profile(profile_id)
	if p.is_empty() or results.is_empty():
		return out
	var stars: int = 0 if partial else _stars_of(results)
	out["stars"] = stars
	_apply_outcomes(p, results, stars, not partial)
	save.save()
	return out

func due_outcomes(profile_id: String) -> PackedStringArray:
	var res: PackedStringArray = PackedStringArray()
	var outs: Dictionary = _profile(profile_id).get("outcomes", {})
	var today: int = clock.today()
	for code: String in outs:
		if Leitner.is_due(int((outs[code] as Dictionary).get("due", 0)), today):
			res.append(code)
	return res

## Dersin (profilin sınıfında) tamamlanmış duraklarında geçen, vadesi gelmiş çıktılar;
## vadesi en eski önce. Boşsa patikada Tekrar Bulutu görünmez.
func review_codes(profile_id: String, subject: String) -> PackedStringArray:
	var p: Dictionary = _profile(profile_id)
	var res: PackedStringArray = PackedStringArray()
	if p.is_empty():
		return res
	var in_subject: Dictionary = {}
	for n: Dictionary in _review_nodes(profile_id, subject):
		for code: Variant in n.get("outcomes", []):
			in_subject[str(code)] = true
	var outs: Dictionary = p["outcomes"]
	var due: Array[String] = []
	for code: String in due_outcomes(profile_id):
		if in_subject.has(code):
			due.append(code)
	due.sort_custom(func(a: String, b: String) -> bool:
		var da: int = int((outs[a] as Dictionary).get("due", 0))
		var db: int = int((outs[b] as Dictionary).get("due", 0))
		return da < db if da != db else a < b)
	res.append_array(due)
	return res

## Tekrar Bulutu için LessonRunner'ın oynatacağı sanal düğüm; tur yoksa {}.
func review_node(profile_id: String, subject: String, rng: RandomNumberGenerator) -> Dictionary:
	var rounds: Array[Dictionary] = ReviewPicker.pick(review_codes(profile_id, subject), _review_nodes(profile_id, subject), rng)
	if rounds.is_empty():
		return {}
	return {"id": "", "intro_voice": REVIEW_INTRO_VOICE, "outcomes": [], "rounds": rounds}

# --- Bilge'nin Ağaç Evi ---

## Profilin bütün duraklarındaki en yüksek yıldızların toplamı (bütün sınıf ve dersler).
func total_stars(profile_id: String) -> int:
	var total: int = 0
	var nodes: Dictionary = _profile(profile_id).get("nodes", {})
	for e: Variant in nodes.values():
		if e is Dictionary:
			total += int((e as Dictionary).get("best_stars", 0))
	return total

## Ağaç evi kataloğu (açılma sırasıyla).
func decor_items() -> PackedStringArray:
	if not _decor_loaded:
		_decor_loaded = true
		_decor_items = TreeHouseRules.load_items(decor_path)
	return _decor_items

## Profilin açtığı süs eşyaları (açılma sırasıyla).
func decor_unlocked(profile_id: String) -> PackedStringArray:
	var items: PackedStringArray = decor_items()
	return items.slice(0, TreeHouseRules.unlocked_count(total_stars(profile_id), items.size()))

## Sıradaki süsün eşiği; hepsi açıldıysa -1.
func next_decor_threshold(profile_id: String) -> int:
	var n: int = decor_unlocked(profile_id).size()
	return TreeHouseRules.threshold(n) if n < decor_items().size() else -1

## Odaya yerleştirilmiş süsler: anahtar -> Vector2 (0–1 oranı).
func decor_layout(profile_id: String) -> Dictionary:
	var res: Dictionary = {}
	var placed: Variant = _profile(profile_id).get("decor", {})
	if not (placed is Dictionary):
		return res
	for key: String in placed:
		var v: Variant = placed[key]
		if v is Array and (v as Array).size() == 2:
			res[key] = Vector2(float(v[0]), float(v[1]))
	return res

## Açılmış bir süsü odada pos (0–1 oranı) konumuna koyar.
func place_decor(profile_id: String, key: String, pos: Vector2) -> void:
	var p: Dictionary = _profile(profile_id)
	if p.is_empty() or not decor_unlocked(profile_id).has(key):
		return
	if not (p.get("decor") is Dictionary):
		p["decor"] = {}
	var c: Vector2 = TreeHouseRules.clamp_pos(pos)
	(p["decor"] as Dictionary)[key] = [c.x, c.y]
	save.save()

## Süsü odadan kaldırıp rafa geri koyar.
func store_decor(profile_id: String, key: String) -> void:
	var p: Dictionary = _profile(profile_id)
	if p.get("decor") is Dictionary and (p["decor"] as Dictionary).has(key):
		(p["decor"] as Dictionary).erase(key)
		save.save()

func _stars_of(results: Array[RoundResult]) -> int:
	var total_wrong: int = 0
	for r: RoundResult in results:
		total_wrong += Stars.round_wrong(r.wrong, r.multi_step)
	return Stars.compute(total_wrong)

## Turların ustalığını işler. leitner: kutu ve vade de güncellenir. Kutu değişmiyorsa
## (yardımsız ve 2 yıldızın altında) mevcut vade korunur, tekrar tarihi ileri itilmez.
func _apply_outcomes(p: Dictionary, results: Array[RoundResult], stars: int, leitner: bool) -> void:
	var outs: Dictionary = p["outcomes"]
	var helped_codes: Dictionary = {}
	var touched: Array[String] = []
	var known: Dictionary = {}
	for r: RoundResult in results:
		for code: String in r.outcomes:
			if not touched.has(code):
				touched.append(code)
				known[code] = outs.has(code)
			var o: Dictionary = outs.get(code, {"mastery": 0.0, "box": 1, "due": 0})
			Mastery.apply_result(o, Mastery.result_value(r.wrong + 1, r.helped))
			outs[code] = o
			if r.helped:
				helped_codes[code] = true
	var today: int = clock.today()
	for code: String in touched:
		var o: Dictionary = outs[code]
		o["last_day"] = today
		if not leitner:
			continue
		var box: int = clampi(int(o.get("box", 1)), 1, 5)
		if helped_codes.has(code):
			box = Leitner.reset()
		elif stars >= 2:
			box = Leitner.promote(box)
		elif bool(known[code]):
			o["box"] = box
			continue
		o["box"] = box
		o["due"] = Leitner.due_day(box, today)

## Tekrar turlarının alınabileceği düğümler: profilin sınıfında, dersin tamamlanmış durakları.
func _review_nodes(profile_id: String, subject: String) -> Array[Dictionary]:
	var res: Array[Dictionary] = []
	var p: Dictionary = _profile(profile_id)
	if p.is_empty():
		return res
	for u: Dictionary in content.units(int(p.get("grade", 1)), subject):
		for n: Dictionary in u["nodes"]:
			if n.has("id") and best_stars(profile_id, str(n["id"])) > 0:
				res.append(n)
	return res

func _profiles() -> Array:
	return save.data["profiles"]

func _find(id: String) -> int:
	var list: Array = _profiles()
	for i: int in list.size():
		if str((list[i] as Dictionary).get("id", "")) == id:
			return i
	return -1

func _profile(id: String) -> Dictionary:
	var i: int = _find(id)
	return _profiles()[i] if i >= 0 else {}

## "g1","matematik" için düğüm kimlikleri, içerik sırasıyla.
func _sequence(grade_key: String, subject: String) -> Array[String]:
	var seq: Array[String] = []
	var grade: int = int(grade_key.trim_prefix("g"))
	for u: Dictionary in content.units(grade, subject):
		for n: Dictionary in u["nodes"]:
			if n.has("id"):
				seq.append(str(n["id"]))
	return seq
