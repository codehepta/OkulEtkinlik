extends RefCounted
## Sahte oyuncu simülasyonu (Faz 7b): gerçek ünitelerin turlarını 1. sınıftan 3. sınıfa sırayla
## oynatır ve uyarlanabilir motorun ölçülerini döner. Geliştirici aracıdır, pakete girmez.
## Kullananlar: `tests/integration/test_adaptive_sim.gd`, `tools/adaptive_report.gd`.
##
## Oyuncu modeli: her profilin oynanan zorluk seviyesine (1–3) göre ilk denemede doğru cevap
## olasılığı vardır. Sonraki denemelerde seçenek azaldığı için olasılık RETRY_BONUS artar;
## aynı çıktıyı her oynayışta PRACTICE_GAIN kadar öğrenir. Üç yanlışta çözüm gösterilir.

const CONTENT_ROOT: String = "res://content"
## Profil -> seviye 1, 2, 3'te ilk deneme başarı olasılığı.
const PROFILES: Dictionary = {
	"guclu": [0.95, 0.88, 0.78],
	"orta": [0.85, 0.68, 0.5],
	"zorlanan": [0.6, 0.4, 0.25],
}
const RETRY_BONUS: float = 0.15
const PRACTICE_GAIN: float = 0.02
const P_MAX: float = 0.98
const WRONG_FOR_SOLUTION: int = 3
## "tuned": güncel motor (adaptive_config.gd, durak içi canlı ayar).
## "legacy": Faz 7b öncesi (ham ustalık, 0.8 / 0.4, ayar yalnızca durak başında).
const MODES: PackedStringArray = ["tuned", "legacy"]

## Bütün sınıfların durakları sırayla: her durak [{"difficulty": int, "outcomes": Array}].
static func load_nodes() -> Array:
	var out: Array = []
	for grade: int in [1, 2, 3]:
		var gdir: String = CONTENT_ROOT.path_join("g%d" % grade)
		var subjects: PackedStringArray = DirAccess.get_directories_at(gdir)
		subjects.sort()
		for subject: String in subjects:
			var sdir: String = gdir.path_join(subject)
			var files: PackedStringArray = DirAccess.get_files_at(sdir)
			files.sort()
			for f: String in files:
				if not (f.begins_with("u") and f.ends_with(".json")):
					continue
				var unit: Variant = JSON.parse_string(FileAccess.get_file_as_string(sdir.path_join(f)))
				if not (unit is Dictionary):
					continue
				for n: Dictionary in (unit as Dictionary).get("nodes", []):
					var rounds: Array = []
					for r: Dictionary in n.get("rounds", []):
						rounds.append({
							"difficulty": int(r.get("difficulty", 1)),
							"outcomes": Array(r.get("outcomes", n.get("outcomes", []))),
						})
					out.append(rounds)
	return out

## Tek oyuncu, tek tohum. Dönen ölçüler oran olarak (0–1); delta_level ortalama
## (oynanan seviye − taban seviye).
static func run(nodes: Array, profile: String, seed_value: int, mode: String) -> Dictionary:
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = seed_value
	var probs: Array = PROFILES[profile]
	var recs: Dictionary = {}
	var practice: Dictionary = {}
	var n_rounds: int = 0
	var first_ok: int = 0
	var helped_n: int = 0
	var delta: int = 0
	var below: int = 0
	var above: int = 0
	var stars: Array[int] = [0, 0, 0, 0]
	for node: Array in nodes:
		var snapshot: Dictionary = recs.duplicate(true)
		var node_wrong: int = 0
		for rd: Dictionary in node:
			var outs: Array = rd["outcomes"]
			var base: int = int(rd["difficulty"])
			var adj: int = 0
			if not outs.is_empty():
				var key: String = str(outs[0])
				if mode == "legacy":
					var m: float = float((snapshot.get(key, {}) as Dictionary).get("mastery", 0.0))
					adj = 1 if m >= 0.8 else (-1 if m <= 0.4 else 0)
				else:
					adj = int((recs.get(key, {}) as Dictionary).get("adj", Mastery.Config.COLD_ADJUST))
			var level: int = Mastery.played_difficulty(base, adj)
			var p: float = minf(P_MAX, float(probs[level - 1]) + PRACTICE_GAIN * float(practice.get(str(outs[0]) if not outs.is_empty() else "", 0)))
			var wrong: int = 0
			var helped: bool = false
			while true:
				if rng.randf() < minf(P_MAX, p + RETRY_BONUS * float(wrong)):
					break
				wrong += 1
				if wrong >= WRONG_FOR_SOLUTION:
					helped = true
					break
			var value: float = Mastery.result_value(wrong + 1, helped)
			for code: Variant in outs:
				var k: String = str(code)
				if not recs.has(k):
					recs[k] = {}
				Mastery.apply_result(recs[k], value)
				practice[k] = int(practice.get(k, 0)) + 1
			node_wrong += Stars.round_wrong(wrong, false)
			n_rounds += 1
			first_ok += 1 if wrong == 0 else 0
			helped_n += 1 if helped else 0
			delta += level - base
			below += 1 if level < base else 0
			above += 1 if level > base else 0
		if not node.is_empty():
			stars[Stars.compute(node_wrong)] += 1
	var n_nodes: float = maxf(1.0, float(stars[1] + stars[2] + stars[3]))
	var nr: float = maxf(1.0, float(n_rounds))
	return {
		"rounds": n_rounds,
		"first_try": first_ok / nr,
		"helped": helped_n / nr,
		"delta_level": delta / nr,
		"below_base": below / nr,
		"above_base": above / nr,
		"star3": stars[3] / n_nodes,
		"star1": stars[1] / n_nodes,
	}

## Birkaç tohumun ortalaması.
static func average(nodes: Array, profile: String, seeds: int, mode: String) -> Dictionary:
	var acc: Dictionary = {}
	for s: int in seeds:
		var r: Dictionary = run(nodes, profile, 1000 + s, mode)
		for k: String in r:
			acc[k] = float(acc.get(k, 0.0)) + float(r[k]) / float(seeds)
	return acc
