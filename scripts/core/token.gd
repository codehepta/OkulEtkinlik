class_name Token
extends RefCounted
## Bütün şablonlarda ortak öğe tanımı (token) için saf doğrulama ve karşılaştırma.
## {"type": "item"|"number"|"text", "value": ..., "voice"?: String}

const TYPES: PackedStringArray = ["item", "number", "text"]

## Token biçimi geçerli mi? item/text: boş olmayan String; number: tam sayı değerli sayı.
## voice varsa boş olmayan String olmalıdır.
static func is_valid(t: Variant) -> bool:
	if not (t is Dictionary):
		return false
	var d: Dictionary = t as Dictionary
	var type: Variant = d.get("type")
	if not (type is String) or not TYPES.has(type as String):
		return false
	var value: Variant = d.get("value")
	if type == "number":
		if not ContentValidator.is_int_like(value):
			return false
	elif not (value is String) or (value as String).is_empty():
		return false
	if d.has("voice"):
		var voice: Variant = d["voice"]
		if not (voice is String) or (voice as String).is_empty():
			return false
	return true

## İki geçerli token aynı öğeyi mi gösteriyor (tür + değer)?
static func same(a: Dictionary, b: Dictionary) -> bool:
	if a.get("type") != b.get("type"):
		return false
	if a.get("type") == "number":
		return int(a["value"]) == int(b["value"])
	return a.get("value") == b.get("value")

static func voice_of(t: Dictionary) -> String:
	return str(t.get("voice", ""))
