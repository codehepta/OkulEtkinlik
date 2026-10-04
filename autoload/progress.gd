extends Node
## Profil ilerlemesi: profiller, durak kilitleri, yıldız, ustalık, Leitner, çıkartma.
## Saf hesaplar Mastery/Leitner/Stars sınıflarındadır; burası kayıt verisini günceller.

const MAX_PROFILES: int = 4

var clock: DayClock = DayClock.new()
## Testlerde değiştirilebilir; boşsa _ready'de autoload'lar bağlanır.
var save: Node = null
var content: Node = null

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

func outcome_mastery(profile_id: String, code: String) -> float:
	var outs: Dictionary = _profile(profile_id).get("outcomes", {})
	var e: Variant = outs.get(code)
	return float((e as Dictionary).get("mastery", 0.0)) if e is Dictionary else 0.0

func record_node(profile_id: String, node_id: String, results: Array[RoundResult]) -> Dictionary:
	var out: Dictionary = {"stars": 0, "new_sticker": "", "unlocked": ""}
	var p: Dictionary = _profile(profile_id)
	if p.is_empty():
		return out
	var total_wrong: int = 0
	for r: RoundResult in results:
		total_wrong += r.wrong
	var stars: int = Stars.compute(total_wrong)
	out["stars"] = stars
	var nodes: Dictionary = p["nodes"]
	var entry: Dictionary = nodes.get(node_id, {"best_stars": 0, "plays": 0})
	var first_time: bool = int(entry.get("plays", 0)) == 0
	entry["best_stars"] = maxi(int(entry.get("best_stars", 0)), stars)
	entry["plays"] = int(entry.get("plays", 0)) + 1
	nodes[node_id] = entry

	var outs: Dictionary = p["outcomes"]
	var helped_codes: Dictionary = {}
	var touched: Array[String] = []
	for r: RoundResult in results:
		for code: String in r.outcomes:
			var o: Dictionary = outs.get(code, {"mastery": 0.0, "box": 1, "due": 0})
			var v: float = Mastery.result_value(r.wrong + 1, r.helped)
			o["mastery"] = Mastery.update(float(o.get("mastery", 0.0)), v)
			outs[code] = o
			if not touched.has(code):
				touched.append(code)
			if r.helped:
				helped_codes[code] = true
	var today: int = clock.today()
	for code: String in touched:
		var o: Dictionary = outs[code]
		var box: int = clampi(int(o.get("box", 1)), 1, 5)
		if helped_codes.has(code):
			box = Leitner.reset()
		elif stars >= 2:
			box = Leitner.promote(box)
		o["box"] = box
		o["due"] = Leitner.due_day(box, today)

	if first_time:
		var sticker: String = str(content.node(node_id).get("sticker", ""))
		var owned: Array = p["stickers"]
		if not sticker.is_empty() and not owned.has(sticker):
			owned.append(sticker)
			out["new_sticker"] = sticker
	out["unlocked"] = content.next_node_id(node_id)
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
