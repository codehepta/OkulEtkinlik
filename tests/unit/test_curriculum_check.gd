extends GutTest
## Müfredat denetleyicisi (tools/curriculum/curriculum_check.gd) testleri.

const CurriculumCheck := preload("res://tools/curriculum/curriculum_check.gd")

const MAT_FILE: String = "docs/curriculum/sources/tymm-ilkokul-matematik.pdf"
const FEN_FILE: String = "docs/curriculum/sources/tymm-fen-bilimleri.pdf"
const MAT_URL: String = "https://tymm.meb.gov.tr/assets/pdf/ilkokul-matematik-dersi_20260902_111356_122.pdf"

var _cc: RefCounted = CurriculumCheck.new()

## Geçerli bir g1 matematik çıktısı (s.20).
func _outcome(code: String = "MAT.1.1.1") -> Dictionary:
	return {
		"grade": 1,
		"subject": "matematik",
		"text": "Nesne sayısını belirler.",
		"printed_code": code + ".",
		"steps": ["a) Nesneleri birer birer sayar.", "b) Sayı adını söyler."],
		"themes": ["g1.matematik.t01"],
		"source": {
			"doc": "İlkokul Matematik Dersi Öğretim Programı",
			"file": MAT_FILE,
			"page": 20,
			"url": MAT_URL,
		},
	}

func _page20(code: String = "MAT.1.1.1") -> String:
	return code + ". Nesne sayısını belirler.\na) Nesneleri birer birer\nsayar.\nb) Sayı adını söyler."

func _pages(p20: String = "", p21: String = "") -> Dictionary:
	if p20 == "":
		p20 = _page20()
	return {MAT_FILE: {20: p20, 21: p21}}

func _themes() -> Dictionary:
	return {"g1.matematik.t01": {}}

func _theme(order: int = 1, codes: Array = ["MAT.1.1.1"], count: int = 1) -> Dictionary:
	return {
		"grade": 1,
		"subject": "matematik",
		"order": order,
		"official": "MAT.1.1. Sayılar ve Nicelikler (1)",
		"declared_count": count,
		"outcomes": codes,
		"source": {"file": MAT_FILE, "page": 20},
	}

func _check(o: Dictionary, pages: Dictionary = {}) -> Array[String]:
	if pages.is_empty():
		pages = _pages()
	return _cc.check_outcomes({"MAT.1.1.1": o}, _themes(), pages)

# --- split_pages / normalize ---

func test_split_pages_parses_markers() -> void:
	var pages: Dictionary = _cc.split_pages("x\n===== SAYFA 1 =====\nA\n===== SAYFA 2 =====\nB")
	assert_eq(pages.keys(), [1, 2])
	assert_true((pages[2] as String).contains("B"))
	assert_false((pages[1] as String).contains("B"))

func test_normalize_ignores_whitespace_tabs_and_hyphenation() -> void:
	assert_eq(
		_cc.normalize("Dinlediği\tsesin  kay-\nnağını ör -\nnek"),
		_cc.normalize("Dinlediği sesin kaynağını örnek"))
	assert_true((_cc.normalize("“eşit”") as String).contains("“"))
	assert_eq(_cc.normalize("a b­c\r"), "abc")

# --- check_outcomes ---

func test_valid_outcome_passes() -> void:
	assert_eq(_check(_outcome()), [] as Array[String])

func test_step_split_across_pages_ignores_running_header() -> void:
	var o: Dictionary = _outcome()
	o["steps"] = ["a) Nesneleri birer birer sayar.", "b) Sayı adını söyler ve kısa çizgi) kuralına uygun kullanır."]
	var p20: String = "MAT.1.1.1. Nesne sayısını belirler.\na) Nesneleri birer birer sayar.\nb) Sayı adını söyler ve kısa\t"
	var p21: String = "\n208\nTÜRKÇE DERSİ (1, 2, 3 VE 4. SINIFLAR) ÖĞRETİM PROGRAMI\nçizgi)\tkuralına uygun kullanır.\n"
	assert_eq(_check(o, _pages(p20, p21)), [] as Array[String])

func test_strip_page_header_only_drops_leading_header_lines() -> void:
	assert_eq(_cc.strip_page_header("\n208\nX DERSİ PROGRAMI\nçizgi)\n209\nmetin"), "çizgi)\n209\nmetin")

func test_text_may_continue_on_next_page() -> void:
	var p20: String = "MAT.1.1.1. Nesne sayısını belirler.\na) Nesneleri birer birer sayar."
	var p21: String = "b) Sayı adını söyler."
	assert_eq(_check(_outcome(), _pages(p20, p21)), [] as Array[String])

func test_code_must_be_on_stated_page() -> void:
	var o: Dictionary = _outcome()
	var e: Array[String] = _check(o, _pages("başka metin", _page20()))
	assert_eq(e.size(), 1)
	assert_true(e[0].contains("MAT.1.1.1"))

func test_wrong_text_rejected() -> void:
	var o: Dictionary = _outcome()
	o["text"] = "Nesne sayısını belirlar."
	var e: Array[String] = _check(o)
	assert_eq(e.size(), 1)
	assert_true(e[0].contains("MAT.1.1.1"))

func test_wrong_step_rejected() -> void:
	var o: Dictionary = _outcome()
	o["steps"] = ["a) Nesneleri birer birer sayar.", "b) Sayı adını yazar."]
	assert_eq(_check(o).size(), 1)

func test_code_prefix_collision_not_accepted() -> void:
	var p20: String = "MAT.1.1.10. Nesne sayısını belirler.\na) Nesneleri birer birer sayar.\nb) Sayı adını söyler."
	var e: Array[String] = _check(_outcome(), _pages(p20))
	assert_eq(e.size(), 1)
	assert_true(e[0].contains("MAT.1.1.1"))

func test_out_of_scope_or_mismatched_codes_rejected() -> void:
	# MAT.4.*: kapsam dışı sınıf.
	var o4: Dictionary = _outcome("MAT.4.1.1")
	var e4: Array[String] = _cc.check_outcomes({"MAT.4.1.1": o4}, _themes(), _pages(_page20("MAT.4.1.1")))
	assert_eq(e4.size(), 1)
	assert_true(e4[0].contains("MAT.4.1.1"))
	# FB.4.*: fen yalnızca 3. sınıf.
	var ofb: Dictionary = _outcome("FB.4.1.1")
	ofb["subject"] = "fen"
	ofb["grade"] = 4
	ofb["source"]["file"] = FEN_FILE
	ofb["source"]["doc"] = "Fen Bilimleri Dersi Öğretim Programı"
	ofb["source"]["url"] = _cc.SUBJECT_SOURCES["fen"]["url"]
	var efb: Array[String] = _cc.check_outcomes({"FB.4.1.1": ofb}, _themes(), {FEN_FILE: {20: _page20("FB.4.1.1")}})
	assert_eq(efb.size(), 1)
	assert_true(efb[0].contains("FB.4.1.1"))
	# Ders deseniyle uyuşmayan kod.
	var ohb: Dictionary = _outcome("HB.1.1.1")
	var ehb: Array[String] = _cc.check_outcomes({"HB.1.1.1": ohb}, _themes(), _pages(_page20("HB.1.1.1")))
	assert_eq(ehb.size(), 1)
	assert_true(ehb[0].contains("HB.1.1.1"))
	# Kodun sınıfı ile grade alanı uyuşmuyor.
	var og: Dictionary = _outcome()
	og["grade"] = 2
	assert_eq(_check(og).size(), 1)
	assert_eq(_cc.code_grade("T.D.3.5", "turkce"), 3)
	assert_eq(_cc.code_grade("FB.4.1.1", "fen"), 0)
	assert_eq(_cc.code_grade("MAT.1.5.1", "matematik"), 0)
	assert_eq(_cc.code_grade("HB.2.3.4", "hayat_bilgisi"), 2)

func test_manual_text_check_requires_note() -> void:
	var o: Dictionary = _outcome()
	o["text_check"] = "manual"
	o["text"] = "Dökümde bozuk olduğu için sayfada geçmeyen metin."
	var e: Array[String] = _check(o)
	assert_eq(e.size(), 1)
	assert_true(e[0].contains("manual_note"))
	o["manual_note"] = "PDF'te görsel olarak doğrulandı."
	assert_eq(_check(o), [] as Array[String])

func test_unknown_theme_reference_rejected() -> void:
	var o: Dictionary = _outcome()
	o["themes"] = ["g1.matematik.t09"]
	var e: Array[String] = _check(o)
	assert_eq(e.size(), 1)
	assert_true(e[0].contains("g1.matematik.t09"))

func test_source_mismatch_and_bad_page_rejected() -> void:
	var o: Dictionary = _outcome()
	o["source"]["url"] = "https://example.com/x.pdf"
	assert_eq(_check(o).size(), 1)
	var o2: Dictionary = _outcome()
	o2["source"]["page"] = 99
	assert_gt(_check(o2).size(), 0)
	var o3: Dictionary = _outcome()
	o3["source"]["page"] = 20.0
	assert_eq(_check(o3), [] as Array[String])
	var o4: Dictionary = _outcome()
	o4["printed_code"] = "MAT.1.1.1"
	assert_eq(_check(o4).size(), 1)

# --- check_themes ---

func _outcomes_for_themes() -> Dictionary:
	return {"MAT.1.1.1": _outcome("MAT.1.1.1"), "MAT.1.1.2": _outcome("MAT.1.1.2")}

func test_valid_themes_pass() -> void:
	var th: Dictionary = {"g1.matematik.t01": _theme(1, ["MAT.1.1.1", "MAT.1.1.2"], 2)}
	assert_eq(_cc.check_themes(th, _outcomes_for_themes()), [] as Array[String])

func test_theme_membership_must_be_bidirectional() -> void:
	var outs: Dictionary = _outcomes_for_themes()
	# Tema listesinde var, çıktının themes dizisinde yok.
	outs["MAT.1.1.2"]["themes"] = []
	var th: Dictionary = {"g1.matematik.t01": _theme(1, ["MAT.1.1.1", "MAT.1.1.2"], 2)}
	var e: Array[String] = _cc.check_themes(th, outs)
	assert_eq(e.size(), 1)
	assert_true(e[0].contains("MAT.1.1.2"))
	# Çıktının themes dizisinde var, tema listesinde yok.
	var th2: Dictionary = {"g1.matematik.t01": _theme(1, ["MAT.1.1.1"], 1)}
	var e2: Array[String] = _cc.check_themes(th2, _outcomes_for_themes())
	assert_eq(e2.size(), 1)
	assert_true(e2[0].contains("MAT.1.1.2"))

func test_theme_order_must_be_contiguous() -> void:
	var outs: Dictionary = {"MAT.1.1.1": _outcome()}
	var o2: Dictionary = _outcome("MAT.1.1.2")
	o2["themes"] = ["g1.matematik.t03"]
	outs["MAT.1.1.2"] = o2
	var th: Dictionary = {
		"g1.matematik.t01": _theme(1, ["MAT.1.1.1"], 1),
		"g1.matematik.t03": _theme(3, ["MAT.1.1.2"], 1),
	}
	var e: Array[String] = _cc.check_themes(th, outs)
	assert_gt(e.size(), 0)
	assert_true(e[0].contains("g1.matematik"))

func test_declared_count_mismatch_needs_note() -> void:
	var th: Dictionary = {"g1.matematik.t01": _theme(1, ["MAT.1.1.1", "MAT.1.1.2"], 3)}
	var e: Array[String] = _cc.check_themes(th, _outcomes_for_themes())
	assert_eq(e.size(), 1)
	assert_true(e[0].contains("g1.matematik.t01"))
	th["g1.matematik.t01"]["declared_count_note"] = "Tabloda 3, gövdede 2 çıktı var."
	assert_eq(_cc.check_themes(th, _outcomes_for_themes()), [] as Array[String])

func test_theme_field_rules() -> void:
	var outs: Dictionary = {"MAT.1.1.1": _outcome()}
	var bad_id: Dictionary = {"g1.mat.t01": _theme()}
	assert_gt(_cc.check_themes(bad_id, outs).size(), 0)
	var bad_grade: Dictionary = {"g1.matematik.t01": _theme()}
	bad_grade["g1.matematik.t01"]["grade"] = 2
	assert_eq(_cc.check_themes(bad_grade, outs).size(), 1)
	var no_official: Dictionary = {"g1.matematik.t01": _theme()}
	no_official["g1.matematik.t01"]["official"] = ""
	assert_eq(_cc.check_themes(no_official, outs).size(), 1)
	var empty_outs: Dictionary = {"g1.matematik.t01": _theme(1, [], 0)}
	assert_gt(_cc.check_themes(empty_outs, outs).size(), 0)
	var unknown_code: Dictionary = {"g1.matematik.t01": _theme(1, ["MAT.1.1.9"], 1)}
	var e: Array[String] = _cc.check_themes(unknown_code, outs)
	assert_gt(e.size(), 0)
	assert_true(e[0].contains("MAT.1.1.9"))
	var wrong_grade_outcome: Dictionary = {"MAT.1.1.1": _outcome()}
	wrong_grade_outcome["MAT.1.1.1"]["subject"] = "fen"
	var th: Dictionary = {"g1.matematik.t01": _theme()}
	assert_gt(_cc.check_themes(th, wrong_grade_outcome).size(), 0)

# --- check_game_map ---

func _gm_outcomes() -> Dictionary:
	return {"MAT.1.1.1": _outcome(), "MAT.1.1.2": _outcome("MAT.1.1.2")}

func _gm_entry() -> Dictionary:
	return {"fit": "full", "templates": ["count_choose"], "note": ""}

func _gm_ok() -> Dictionary:
	return {"MAT.1.1.1": _gm_entry(), "MAT.1.1.2": _gm_entry()}

func _gm_subjects() -> PackedStringArray:
	return PackedStringArray(["matematik"])

func test_game_map_rules() -> void:
	assert_eq(_cc.check_game_map(_gm_ok(), _gm_outcomes(), _gm_subjects()), [] as Array[String])
	# Eksik kayıt.
	var missing: Dictionary = {"MAT.1.1.1": _gm_entry()}
	var e: Array[String] = _cc.check_game_map(missing, _gm_outcomes(), _gm_subjects())
	assert_eq(e.size(), 1)
	assert_true(e[0].contains("MAT.1.1.2"))
	# game_map'te çıktılarda olmayan kod.
	var extra: Dictionary = _gm_ok()
	extra["MAT.1.1.9"] = _gm_entry()
	assert_eq(_cc.check_game_map(extra, _gm_outcomes(), _gm_subjects()).size(), 1)
	# fit geçersiz.
	var maybe: Dictionary = _gm_ok()
	maybe["MAT.1.1.1"]["fit"] = "maybe"
	assert_gt(_cc.check_game_map(maybe, _gm_outcomes(), _gm_subjects()).size(), 0)
	# spec dışı şablon.
	var bad_tpl: Dictionary = _gm_ok()
	bad_tpl["MAT.1.1.1"]["templates"] = ["yok_sablon"]
	assert_eq(_cc.check_game_map(bad_tpl, _gm_outcomes(), _gm_subjects()).size(), 1)
	# none + şablon.
	var none_tpl: Dictionary = _gm_ok()
	none_tpl["MAT.1.1.1"] = {"fit": "none", "templates": ["count_choose"], "note": "Sözlü etkinlik."}
	assert_eq(_cc.check_game_map(none_tpl, _gm_outcomes(), _gm_subjects()).size(), 1)
	# full + boş şablon.
	var full_empty: Dictionary = _gm_ok()
	full_empty["MAT.1.1.1"]["templates"] = []
	assert_eq(_cc.check_game_map(full_empty, _gm_outcomes(), _gm_subjects()).size(), 1)
	# notsuz partial.
	var partial_no_note: Dictionary = _gm_ok()
	partial_no_note["MAT.1.1.1"] = {"fit": "partial", "templates": ["count_choose"], "note": ""}
	assert_eq(_cc.check_game_map(partial_no_note, _gm_outcomes(), _gm_subjects()).size(), 1)
	# geçerli partial / none.
	var ok_pn: Dictionary = _gm_ok()
	ok_pn["MAT.1.1.1"] = {"fit": "partial", "templates": ["count_choose"], "note": "a) oynanır."}
	ok_pn["MAT.1.1.2"] = {"fit": "none", "templates": [], "note": "Sözlü etkinlik."}
	assert_eq(_cc.check_game_map(ok_pn, _gm_outcomes(), _gm_subjects()), [] as Array[String])
	# proposed biçimi.
	var bad_prop: Dictionary = _gm_ok()
	bad_prop["MAT.1.1.1"]["proposed"] = ["Compare"]
	assert_eq(_cc.check_game_map(bad_prop, _gm_outcomes(), _gm_subjects()).size(), 1)
	var ok_prop: Dictionary = _gm_ok()
	ok_prop["MAT.1.1.1"]["proposed"] = ["compare_groups"]
	assert_eq(_cc.check_game_map(ok_prop, _gm_outcomes(), _gm_subjects()), [] as Array[String])

func test_game_map_ignores_out_of_scope_subjects() -> void:
	var outs: Dictionary = _gm_outcomes()
	var fen: Dictionary = _outcome("FB.3.1.1")
	fen["subject"] = "fen"
	fen["grade"] = 3
	outs["FB.3.1.1"] = fen
	assert_eq(_cc.check_game_map(_gm_ok(), outs, _gm_subjects()), [] as Array[String])
	var with_fen: PackedStringArray = PackedStringArray(["matematik", "fen"])
	assert_eq(_cc.check_game_map(_gm_ok(), outs, with_fen).size(), 1)

# --- sayım ---

func test_count_by_grade_subject() -> void:
	var fen: Dictionary = _outcome("FB.3.1.1")
	fen["subject"] = "fen"
	fen["grade"] = 3
	var outs: Dictionary = {"MAT.1.1.1": _outcome(), "MAT.1.1.2": _outcome("MAT.1.1.2"), "FB.3.1.1": fen}
	assert_eq(_cc.count_by_grade_subject(outs), {"g1.matematik": 2, "g3.fen": 1})
