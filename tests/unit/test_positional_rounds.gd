extends GutTest
## "Soldan say" gibi konuma dayalı yönergeler: seslendirme çocuğa ekrandaki sırayı saydırıyorsa
## seçenekler karıştırılmamalı (listen_find `ordered: true`) ve sıra sayısı sesi ("vo.*.sira.N")
## hedefin soldan N. seçenek olduğunu söylemelidir. Bütün sınıf ve dersleri tarar.

const CONTENT_DIR: String = "res://content"
const POSITIONAL_WORDS: Array[String] = ["soldan say", "soldan başla", "sağdan say", "sağdan başla", "baştan say", "sondan say"]

var _voice: Dictionary = {}

func before_all() -> void:
	var v: Variant = JSON.parse_string(FileAccess.get_file_as_string(CONTENT_DIR.path_join("voice_lines.tr.json")))
	_voice = v if v is Dictionary else {}

func _unit_files() -> Array[String]:
	var out: Array[String] = []
	for g: String in DirAccess.get_directories_at(CONTENT_DIR):
		if not g.begins_with("g"):
			continue
		for subj: String in DirAccess.get_directories_at(CONTENT_DIR.path_join(g)):
			var dir: String = CONTENT_DIR.path_join(g).path_join(subj)
			for f: String in DirAccess.get_files_at(dir):
				if f.begins_with("u") and f.ends_with(".json"):
					out.append(dir.path_join(f))
	out.sort()
	return out

func _text(key: String) -> String:
	var e: Variant = _voice.get(key)
	return str((e as Dictionary).get("text", "")).to_lower() if e is Dictionary else ""

func _is_positional(text: String) -> bool:
	for w: String in POSITIONAL_WORDS:
		if text.contains(w):
			return true
	return false

func _rounds() -> Array[Dictionary]:
	var out: Array[Dictionary] = []
	for path: String in _unit_files():
		var unit: Variant = JSON.parse_string(FileAccess.get_file_as_string(path))
		if not (unit is Dictionary):
			continue
		for node: Variant in (unit as Dictionary).get("nodes", []) as Array:
			var rounds: Array = (node as Dictionary).get("rounds", []) as Array
			for i: int in rounds.size():
				var r: Dictionary = rounds[i] as Dictionary
				out.append({"id": "%s r%d" % [(node as Dictionary).get("id", path), i + 1], "round": r})
	return out

func test_content_found() -> void:
	assert_gt(_unit_files().size(), 20, "ünite dosyaları bulunmalı")
	assert_false(_voice.is_empty())

func test_positional_listen_find_rounds_keep_order_and_ordinal_matches() -> void:
	var checked: int = 0
	for entry: Dictionary in _rounds():
		var r: Dictionary = entry["round"]
		if not _is_positional(_text(str(r.get("voice", "")))):
			continue
		var id: String = entry["id"]
		assert_eq(str(r.get("template")), "listen_find", "%s: konuma dayalı tur yalnızca listen_find ile desteklenir" % id)
		var p: Dictionary = r.get("params", {})
		assert_true(bool(p.get("ordered", false)), "%s: 'soldan say' turunda seçenekler karıştırılmamalı (ordered: true)" % id)
		var target: Dictionary = p.get("target", {})
		var tv: String = str(target.get("voice", ""))
		var n: int = int(tv.get_slice(".sira.", 1)) if tv.contains(".sira.") else 0
		assert_gt(n, 0, "%s: hedef sesi bir sıra sayısı (vo.*.sira.N) olmalı" % id)
		var options: Array = p.get("options", []) as Array
		var at: int = -1
		for i: int in options.size():
			if Token.same(options[i] as Dictionary, target):
				at = i
		assert_eq(at + 1, n, "%s: hedef soldan %d. seçenek olmalı" % [id, n])
		checked += 1
	assert_gt(checked, 0, "en az bir 'soldan say' turu denetlenmeli")
