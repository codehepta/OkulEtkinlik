extends MiniGame
## Say ve seç şablonu. Sahne ve oyun mantığı Task 11'de tamamlanır;
## şimdilik yalnızca parametre doğrulaması vardır.

static func validate_params(p: Dictionary) -> Array[String]:
	var errs: Array[String] = []
	if not (p.get("item") is String) or (p["item"] as String).is_empty():
		errs.append(ContentValidator.msg("err.params.item"))
	var count_ok: bool = ContentValidator.is_int_like(p.get("count")) and int(p["count"]) >= 1 and int(p["count"]) <= 20
	if not count_ok:
		errs.append(ContentValidator.msg("err.params.count"))
	var choices: Variant = p.get("choices")
	var choices_ok: bool = choices is Array and (choices as Array).size() >= 2 and (choices as Array).size() <= 4
	if choices_ok:
		for c: Variant in choices:
			if not ContentValidator.is_int_like(c):
				choices_ok = false
	if not choices_ok:
		errs.append(ContentValidator.msg("err.params.choices"))
		return errs
	var seen: Dictionary = {}
	for c: Variant in choices:
		if seen.has(int(c)):
			errs.append(ContentValidator.msg("err.params.choices_dup"))
			break
		seen[int(c)] = true
	if count_ok and not seen.has(int(p["count"])):
		errs.append(ContentValidator.msg("err.params.choices_missing_count"))
	return errs
