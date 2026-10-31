extends "res://tests/helpers/template_harness.gd"
## Tam oynanış testi (yavaş; normal paketin dışında):
##   godot --headless --path . -s addons/gut/gut_cmdln.gd -gdir=res://tests_slow -gexit
## Bütün sınıf ve derslerdeki her tur gerçek şablon sahnesinde kendi zorluğunda kurulur ve doğru
## cevapla sonuna kadar oynanır: tur `finished` sinyaliyle bitmeli ve sonuç "yardımsız doğru"
## olmalı. Her tur ayrıca en zor seviyede açılır ve ilk ipucu çalıştırılır. Turlar hızlı bitsin
## diye partiler hâlinde aynı anda oynatılır.

const CONTENT_DIR: String = "res://content"
const BATCH: int = 24
const MAX_STEPS: int = 40  # grafik kurma turlarında her nesne ayrı adım (12+ sürükleme + sorular)
const STEP_SECONDS: float = 1.0
## İpucu 2 kalan adımları sırayla çözer; grafik turlarında 12+ nesne olabilir.
const HINT_2_MAX_SECONDS: int = 40

var _saved_settings: Variant = null

func before_all() -> void:
	# Kilit ve animasyon süreleri kısalsın (yalnız bu test için; sonra geri konur).
	_saved_settings = SaveService.data.get("settings", {})
	var s: Dictionary = (_saved_settings as Dictionary).duplicate() if _saved_settings is Dictionary else {}
	s["reduce_motion"] = true
	SaveService.data["settings"] = s

func after_all() -> void:
	SaveService.data["settings"] = _saved_settings

## Bütün turlar: {"konum", "grade", "template", "params", "difficulty"}.
func _all_rounds() -> Array[Dictionary]:
	var res: Array[Dictionary] = []
	for g: int in [1, 2, 3]:
		var gdir: String = "%s/g%d" % [CONTENT_DIR, g]
		for subj: String in DirAccess.get_directories_at(gdir):
			for f: String in DirAccess.get_files_at("%s/%s" % [gdir, subj]):
				if not f.ends_with(".json"):
					continue
				var parsed: Variant = JSON.parse_string(FileAccess.get_file_as_string("%s/%s/%s" % [gdir, subj, f]))
				if not (parsed is Dictionary) or not (parsed as Dictionary).has("nodes"):
					continue
				for n: Variant in (parsed as Dictionary)["nodes"]:
					var rounds: Array = (n as Dictionary).get("rounds", [])
					for i: int in rounds.size():
						var rd: Dictionary = rounds[i]
						res.append({"konum": "%s r%d" % [str((n as Dictionary)["id"]), i + 1], "grade": g,
							"template": str(rd["template"]), "params": _ints(rd["params"]),
							"difficulty": int(rd.get("difficulty", 1))})
	return res

func test_every_round_plays_to_the_end() -> void:
	var rounds: Array[Dictionary] = _all_rounds()
	assert_gt(rounds.size(), 1000, "bütün turlar yüklenmeli")
	var failed: Array[String] = []
	var played: int = 0
	for start: int in range(0, rounds.size(), BATCH):
		var batch: Array[Dictionary] = rounds.slice(start, start + BATCH)
		var games: Array[MiniGame] = []
		var done: Dictionary = {}
		for i: int in batch.size():
			var rd: Dictionary = batch[i]
			var g: MiniGame = make(str(rd["template"]), rd["params"] as Dictionary, int(rd["difficulty"]), 7 + i, int(rd["grade"]))
			g.finished.connect(func(r: RoundResult) -> void: done[i] = r)
			games.append(g)
		for step: int in MAX_STEPS:
			if done.size() == games.size():
				break
			for i: int in games.size():
				if not done.has(i) and games[i]._can_input():
					games[i].call("_debug_answer", true)
			await wait_seconds(STEP_SECONDS)
		for i: int in games.size():
			var rd: Dictionary = batch[i]
			if not done.has(i):
				failed.append("%s · %s: bitmedi" % [rd["konum"], rd["template"]])
			elif (done[i] as RoundResult).wrong > 0 or (done[i] as RoundResult).helped:
				failed.append("%s · %s: doğru cevap yanlış sayıldı" % [rd["konum"], rd["template"]])
			else:
				played += 1
			games[i].queue_free()
		await wait_frames(2)
	gut.p("Oynanan tur: %d / %d" % [played, rounds.size()])
	assert_eq(failed, [] as Array[String], "\n".join(failed))

func test_every_round_opens_at_hardest_level_with_hint() -> void:
	var rounds: Array[Dictionary] = _all_rounds()
	var n: int = 0
	for rd: Dictionary in rounds:
		var g: MiniGame = make(str(rd["template"]), rd["params"] as Dictionary, 3, 11, int(rd["grade"]))
		g.show_hint(1)
		g.queue_free()
		n += 1
		if n % 50 == 0:
			await wait_frames(1)
	assert_eq(results.size(), 0, "kurulum ve ilk ipucu turu kendiliğinden bitirmemeli")

## Hata akışı (lesson_runner): 2. yanlışta ipucu 1, 3. yanlışta ipucu 2 doğru cevabı gösterip seçer.
## İpucu 2 yanlış seçeneği gösterirse tur bitmez ya da fazladan yanlış sayılır.
func test_every_round_hint_2_picks_the_correct_answer() -> void:
	var rounds: Array[Dictionary] = _all_rounds()
	var failed: Array[String] = []
	for start: int in range(0, rounds.size(), BATCH):
		var batch: Array[Dictionary] = rounds.slice(start, start + BATCH)
		var games: Array[MiniGame] = []
		var done: Dictionary = {}
		for i: int in batch.size():
			var rd: Dictionary = batch[i]
			var g: MiniGame = make(str(rd["template"]), rd["params"] as Dictionary, int(rd["difficulty"]), 7 + i, int(rd["grade"]))
			g.finished.connect(func(r: RoundResult) -> void: done[i] = r)
			games.append(g)
		# İki yanlış (aralarda kilit açılsın), sonra ipucu 1 ve ipucu 2.
		for k: int in 2:
			for g: MiniGame in games:
				if g._can_input():
					g.call("_debug_answer", false)
			await wait_seconds(STEP_SECONDS)
		for g: MiniGame in games:
			g.show_hint(1)
		await wait_seconds(STEP_SECONDS)
		var wrong_before: Array[int] = []
		var done_before: Dictionary = done.duplicate()
		for g: MiniGame in games:
			wrong_before.append(g.wrong_count)
			g.show_hint(2)
		for step: int in HINT_2_MAX_SECONDS:
			if done.size() == games.size():
				break
			await wait_seconds(STEP_SECONDS)
		for i: int in games.size():
			var rd: Dictionary = batch[i]
			var where: String = "%s · %s" % [rd["konum"], rd["template"]]
			if done_before.has(i):
				pass  # test kancasının "yanlış" girdisi turu bitirdi (ör. yatay çizgide yatay kaydırma)
			elif not done.has(i):
				failed.append("%s: ipucu 2 turu bitirmedi (yanlış=%d)" % [where, games[i].wrong_count])
			elif (done[i] as RoundResult).wrong != wrong_before[i] or not (done[i] as RoundResult).helped:
				failed.append("%s: ipucu 2 yanlış cevap verdi (yanlış %d → %d)" % [where, wrong_before[i], (done[i] as RoundResult).wrong])
			games[i].queue_free()
		await wait_frames(2)
	assert_eq(failed, [] as Array[String], "\n".join(failed))

## JSON sayıları float gelir; ContentDB gibi tam sayıya çevir.
func _ints(v: Variant) -> Variant:
	if v is Dictionary:
		var d: Dictionary = {}
		for k: Variant in v:
			d[k] = _ints(v[k])
		return d
	if v is Array:
		var a: Array = []
		for x: Variant in v:
			a.append(_ints(x))
		return a
	if v is float and is_equal_approx(v, roundf(v)):
		return int(v)
	return v
