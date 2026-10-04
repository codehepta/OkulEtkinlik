extends GutTest
## Gerçek ContentDB autoload'u açılışta içeriği yüklemiş olmalı (cihazda "yakında" kalmasın).

func test_singleton_loaded_real_content_at_boot() -> void:
	var db: Node = get_tree().root.get_node("ContentDB")
	assert_false(db.node("g1.matematik.u01.n01").is_empty(), "ilk durak yüklü")
	assert_gte(db.units(1, "matematik").size(), 1)
	assert_eq(db.errors, [] as Array[String], "gerçek içerik hatasız")

func test_vertical_slice_outcomes_still_resolve() -> void:
	var db: Node = get_tree().root.get_node("ContentDB")
	assert_ne(str(db.outcome_info("MAT.1.1.1").get("text", "")), "", "MAT.1.1.1 metni dolu olmalı")
	var unit: Variant = JSON.parse_string(FileAccess.get_file_as_string("res://content/g1/matematik/u01.json"))
	assert_true(unit is Dictionary)
	var codes: Dictionary = {}
	_collect_codes(unit, codes)
	assert_gt(codes.size(), 0, "ünitede çıktı kodu bulunmalı")
	for code: String in codes.keys():
		assert_false(db.outcome_info(code).is_empty(), "outcome_info'da yok: %s" % code)

## `outcomes` dizilerindeki bütün kodları (iç içe) toplar.
func _collect_codes(v: Variant, out: Dictionary) -> void:
	if v is Dictionary:
		for k: Variant in (v as Dictionary).keys():
			if str(k) == "outcomes" and (v as Dictionary)[k] is Array:
				for c: Variant in (v as Dictionary)[k]:
					out[str(c)] = true
			else:
				_collect_codes((v as Dictionary)[k], out)
	elif v is Array:
		for e: Variant in v:
			_collect_codes(e, out)
