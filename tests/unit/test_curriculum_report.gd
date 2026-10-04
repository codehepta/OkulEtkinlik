extends GutTest
## Müfredat matrisi üreticisi (tools/curriculum/report.gd) küçük fixture testleri.

const CurriculumReport := preload("res://tools/curriculum/report.gd")

func _fixture() -> Array[Dictionary]:
	var outcomes: Dictionary = {
		"MAT.1.1.1": {
			"grade": 1,
			"subject": "matematik",
			"text": "Nesne sayısını | belirler.",
			"source": {"page": 20},
		},
	}
	var themes: Dictionary = {
		"g1.matematik.t01": {
			"grade": 1,
			"subject": "matematik",
			"order": 1,
			"official": "MAT.1.1. Sayılar",
			"declared_count": 1,
			"outcomes": ["MAT.1.1.1"],
			"source": {"page": 20},
		},
	}
	var game_map: Dictionary = {
		"MAT.1.1.1": {
			"fit": "partial",
			"templates": ["count_choose"],
			"note": "a) oynanır | b) sözlü\nikinci satır",
		},
	}
	return [outcomes, themes, game_map]

func _row_of(md: String, code: String) -> String:
	for line: String in md.split("\n"):
		if line.begins_with("| %s |" % code):
			return line
	return ""

func test_render_escapes_pipes_and_newlines_in_table_cells() -> void:
	var f: Array[Dictionary] = _fixture()
	var md: String = CurriculumReport.render(f[0], f[1], f[2])
	var row: String = _row_of(md, "MAT.1.1.1")
	assert_ne(row, "", "çıktı satırı bulunamadı")
	assert_true(row.contains("a) oynanır \\| b) sözlü ikinci satır"), row)
	assert_true(row.contains("Nesne sayısını \\| belirler."), row)
	assert_true(row.contains("kısmi"))
	assert_true(row.contains("`count_choose`"))
	# Not hücresindeki satır sonu satırı bölmemeli: "ikinci satır" ayrı bir satır olarak başlamaz.
	for line: String in md.split("\n"):
		assert_false(line.begins_with("ikinci satır"))

func test_render_empty_sections_say_yok() -> void:
	var f: Array[Dictionary] = _fixture()
	var md: String = CurriculumReport.render(f[0], f[1], f[2])
	assert_true(md.contains("## Önerilen yeni şablonlar\n\nYok."))
	assert_true(md.contains("(`manual_note`)\n\nYok."))
	assert_true(md.contains("(`declared_count_note`)\n\nYok."))
	assert_true(md.ends_with("Yok.\n"))
