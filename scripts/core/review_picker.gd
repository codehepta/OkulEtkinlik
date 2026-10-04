extends RefCounted
## Tekrar Bulutu turlarını seçer (spec §3.4): vadesi gelen çıktılardan karışık, en çok
## `count` tur. Her çıktıdan sırayla birer tur alınır (vadesi en eski önce), sonra
## turlar karıştırılır. Her tura kendi düğümünün çıktıları "outcomes" olarak eklenir.
## Saf mantık, sahnesiz.

const DEFAULT_COUNT: int = 3

## due: vadesi gelen çıktı kodları (öncelik sırasıyla); nodes: tekrar edilebilir düğümler.
static func pick(due: PackedStringArray, nodes: Array[Dictionary], rng: RandomNumberGenerator, count: int = DEFAULT_COUNT) -> Array[Dictionary]:
	var pools: Array[Array] = []
	for code: String in due:
		var pool: Array = []
		for n: Dictionary in nodes:
			var outs: Array = n.get("outcomes", [])
			if not outs.has(code):
				continue
			var rounds: Array = n.get("rounds", [])
			for i: int in rounds.size():
				pool.append({"key": "%s#%d" % [str(n.get("id", "")), i], "round": rounds[i], "outcomes": outs})
		if not pool.is_empty():
			pools.append(pool)
	var picked: Array[Dictionary] = []
	var used: Dictionary = {}
	while picked.size() < count:
		var added: bool = false
		for pool: Array in pools:
			if picked.size() >= count:
				break
			var free: Array = pool.filter(func(c: Dictionary) -> bool: return not used.has(c["key"]))
			if free.is_empty():
				continue
			var c: Dictionary = free[rng.randi_range(0, free.size() - 1)]
			used[c["key"]] = true
			var rd: Dictionary = (c["round"] as Dictionary).duplicate(true)
			rd["outcomes"] = (c["outcomes"] as Array).duplicate()
			picked.append(rd)
			added = true
		if not added:
			break
	for i: int in range(picked.size() - 1, 0, -1):
		var j: int = rng.randi_range(0, i)
		var tmp: Dictionary = picked[i]
		picked[i] = picked[j]
		picked[j] = tmp
	return picked
