extends GutTest
## Müfredat taslak çıkarıcı (tools/curriculum/outcome_extract.gd) testleri.

const OutcomeExtract := preload("res://tools/curriculum/outcome_extract.gd")
const CurriculumCheck := preload("res://tools/curriculum/curriculum_check.gd")

const FEN_FILE: String = "docs/curriculum/sources/tymm-fen-bilimleri.pdf"

func _fen_page19() -> String:
	return "19\nFEN BILIMLERI DERSI ÖĞRETIM PROGRAMI19\nÖĞRENME ÇIKTILARI\nVE SÜREÇ BİLEŞENLERİ\n" \
		+ "FB.3.1.1. Bilimsel bilgiye ulaşma yollarını sorgulayabilme\n" \
		+ "a) Merak ettiği bilimsel bir konuyu tanımlar.\n" \
		+ "b) İlgili konu hakkında sorular sorar.\n" \
		+ "İÇERİK ÇERÇEVESİ Bilimsel Bilgiye Ulaşma Yolları\n" \
		+ "Anahtar Kavramlar bilim insanı, bilimsel bilgi\n"

func test_extracts_code_title_and_steps() -> void:
	var d: Dictionary = OutcomeExtract.extract({19: _fen_page19()}, "fen", 1, 60)
	assert_eq(d.size(), 1)
	assert_true(d.has("FB.3.1.1"))
	var e: Dictionary = d["FB.3.1.1"]
	assert_eq(e["text"], "Bilimsel bilgiye ulaşma yollarını sorgulayabilme")
	assert_eq(e["steps"].size(), 2)
	assert_eq(e["steps"][1], "b) İlgili konu hakkında sorular sorar.")
	assert_eq(int(e["source"]["page"]), 19)
	assert_eq(e["printed_code"], "FB.3.1.1.")
	assert_eq(int(e["grade"]), 3)
	assert_eq(e["subject"], "fen")
	assert_eq(e["source"]["file"], FEN_FILE)
	assert_eq(e["source"]["doc"], "Fen Bilimleri Dersi Öğretim Programı")
	assert_false(e.has("themes"))

func test_table_label_prefix_and_tabs() -> void:
	var page: String = "202\nVE SÜREÇ BİLEŞENLERİ T.D.1.2. Dinledikleri/izledikleri ile ilgili anlam oluşturabilme\n" \
		+ "b)\t Dinlediği\tsesin\tkaynağını\ttahmin\teder.\t\n" \
		+ "KONUŞMA\n"
	var d: Dictionary = OutcomeExtract.extract({202: page}, "turkce", 1, 300)
	assert_true(d.has("T.D.1.2"))
	var e: Dictionary = d["T.D.1.2"]
	assert_eq(e["text"], "Dinledikleri/izledikleri ile ilgili anlam oluşturabilme")
	assert_eq(e["steps"], ["b) Dinlediği sesin kaynağını tahmin eder."])

func test_wrapped_title_and_hyphenation_joined() -> void:
	var page: String = "MAT.1.1.4. İki niceliğin büyüklüğünü “çok” veya “eşit” terimle -\n" \
		+ "riyle karşılaştırabilme\n" \
		+ "a) İki niceliğin büyüklüğünü ifade eder, parça-\n" \
		+ "ları belirler.\n"
	var d: Dictionary = OutcomeExtract.extract({20: page}, "matematik", 1, 60)
	var e: Dictionary = d["MAT.1.1.4"]
	assert_eq(e["text"], "İki niceliğin büyüklüğünü “çok” veya “eşit” terimleriyle karşılaştırabilme")
	assert_eq(e["steps"], ["a) İki niceliğin büyüklüğünü ifade eder, parçaları belirler."])

func test_out_of_scope_codes_skipped() -> void:
	var page: String = "MAT.1.1.1. Birinci çıktı\na) Adım bir.\nMAT.4.1.1. Dördüncü sınıf çıktısı\na) Adım dört.\n"
	var d: Dictionary = OutcomeExtract.extract({20: page}, "matematik", 1, 60)
	assert_true(d.has("MAT.1.1.1"))
	assert_false(d.has("MAT.4.1.1"))
	assert_eq(d.size(), 1)
	# Kapsam dışı koddan sonraki adım önceki çıktıya sızmaz.
	assert_eq(d["MAT.1.1.1"]["steps"].size(), 1)

func test_first_occurrence_wins() -> void:
	var pages: Dictionary = {
		20: "MAT.1.1.1. İlk metin\na) Birinci adım.\n",
		40: "MAT.1.1.1. İlk metin\na) Birinci adım.\nb) Sonradan görülen adım.\n",
	}
	var d: Dictionary = OutcomeExtract.extract(pages, "matematik", 1, 60)
	assert_eq(int(d["MAT.1.1.1"]["source"]["page"]), 20)
	assert_eq(d["MAT.1.1.1"]["steps"].size(), 1)

func test_unicode_space_after_step_letter_splits_steps() -> void:
	var page: String = "MAT.2.2.1. Örnek çıktı\n" \
		+ "g) Uzun bir adım metni burada sürer ve devam eder.\n" \
		+ "ğ)\u2002 Çözüme ulaşır.\n" \
		+ "h)\u2002Sonuç yazar.\n"
	var d: Dictionary = OutcomeExtract.extract({30: page}, "matematik", 1, 60)
	assert_eq(d["MAT.2.2.1"]["steps"], [
		"g) Uzun bir adım metni burada sürer ve devam eder.", "ğ) Çözüme ulaşır.", "h) Sonuç yazar."])

func test_page_range_respected() -> void:
	var pages: Dictionary = {5: "MAT.1.1.1. Aralık dışı\n", 20: "MAT.1.1.2. Aralık içi\n"}
	var d: Dictionary = OutcomeExtract.extract(pages, "matematik", 10, 60)
	assert_false(d.has("MAT.1.1.1"))
	assert_true(d.has("MAT.1.1.2"))

func test_code_without_title_is_not_a_start() -> void:
	var page: String = "Uygulamaları HB.1.1.1\nHB.1.1.2\nHB.1.1.3. Gerçek çıktı metni\nİÇERİK ÇERÇEVESİ x\n"
	var d: Dictionary = OutcomeExtract.extract({15: page}, "hayat_bilgisi", 1, 60)
	assert_eq(d.keys(), ["HB.1.1.3"])
	assert_false(d["HB.1.1.3"].has("steps"))

func test_consecutive_codes_without_steps() -> void:
	var page: String = "ÖĞRENME ÇIKTILARI\nVE SÜREÇ BİLEŞENLERİ HB.1.1.1. Öğretmeni ve arkadaşlarıyla tanışabilme\n" \
		+ "HB.1.1.2. Sınıf ve okul ortamını tanıyabilme\nİÇERİK ÇERÇEVESİ Öğretmen\n"
	var d: Dictionary = OutcomeExtract.extract({15: page}, "hayat_bilgisi", 1, 60)
	assert_eq(d.size(), 2)
	assert_eq(d["HB.1.1.1"]["text"], "Öğretmeni ve arkadaşlarıyla tanışabilme")
	assert_eq(d["HB.1.1.2"]["text"], "Sınıf ve okul ortamını tanıyabilme")

func test_all_caps_label_ends_block() -> void:
	var page: String = "T.D.1.1. Dinlemeyi yönetebilme\na) Birinci adım.\nKONUŞMA\nbu satır sızmamalı\nT.K.1.1. Konuşmalarını yönetebilme\n"
	var d: Dictionary = OutcomeExtract.extract({202: page}, "turkce", 1, 300)
	assert_eq(d["T.D.1.1"]["steps"], ["a) Birinci adım."])
	assert_true(d.has("T.K.1.1"))

func test_turkish_step_letters() -> void:
	var page: String = "T.D.1.2. Anlam oluşturabilme\nç)\t Ç adımı.\nğ)\t Ğ adımı.\nı) I adımı.\n"
	var d: Dictionary = OutcomeExtract.extract({202: page}, "turkce", 1, 300)
	assert_eq(d["T.D.1.2"]["steps"], ["ç) Ç adımı.", "ğ) Ğ adımı.", "ı) I adımı."])

func test_block_continues_across_page_boundary() -> void:
	var pages: Dictionary = {
		202: "T.K.1.2. Konuşmalarında içerik oluşturabilme\ne) Beşinci adım.\n",
		203: "203\nTÜRKÇE DERSİ (1, 2, 3 VE 4. SINIFLAR) ÖĞRETİM PROGRAMI\nf) Altıncı adım.\nT.K.1.3. Sonraki çıktı\n",
	}
	var d: Dictionary = OutcomeExtract.extract(pages, "turkce", 1, 300)
	assert_eq(d["T.K.1.2"]["steps"], ["e) Beşinci adım.", "f) Altıncı adım."])
	assert_eq(int(d["T.K.1.2"]["source"]["page"]), 202)
	assert_eq(int(d["T.K.1.3"]["source"]["page"]), 203)

func test_closed_block_does_not_continue_across_page() -> void:
	var pages: Dictionary = {
		19: "FB.3.1.1. Metin\na) Adım.\nİÇERİK ÇERÇEVESİ x\n",
		20: "20\nFEN BILIMLERI DERSI ÖĞRETIM PROGRAMI20\nb) İlgisiz satır.\n",
	}
	var d: Dictionary = OutcomeExtract.extract(pages, "fen", 1, 60)
	assert_eq(d["FB.3.1.1"]["steps"], ["a) Adım."])

func test_extracted_entry_passes_checker() -> void:
	var d: Dictionary = OutcomeExtract.extract({19: _fen_page19()}, "fen", 1, 60)
	var entry: Dictionary = d["FB.3.1.1"]
	entry["themes"] = ["g3.fen.t01"]
	var themes: Dictionary = {"g3.fen.t01": {}}
	var errs: Array[String] = CurriculumCheck.check_outcomes(d, themes, {FEN_FILE: {19: _fen_page19()}})
	assert_eq(errs, [] as Array[String])
