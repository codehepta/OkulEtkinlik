extends SceneTree
## Müfredat taslak çıkarma CLI'si (geliştirici aracı).
## Kullanım: godot --headless --path . -s res://tools/extract_outcomes.gd -- <ders> <ilk_sayfa> <son_sayfa>
## Not: Türkçe, süreç bileşenlerinin tamamı EK 1'de olduğundan EK 1 aralığından çıkarılır: -- turkce 202 <EK 1'in son sayfası>.
## Sonuç: res://build/curriculum/<ders>.draft.json (git'te yok sayılır). Taslak elle gözden geçirilir.

const CurriculumCheck := preload("res://tools/curriculum/curriculum_check.gd")
const OutcomeExtract := preload("res://tools/curriculum/outcome_extract.gd")

func _init() -> void:
	var args: PackedStringArray = OS.get_cmdline_user_args()
	if args.size() != 3 or not CurriculumCheck.SUBJECT_SOURCES.has(args[0]) or not args[1].is_valid_int() or not args[2].is_valid_int() or int(args[1]) > int(args[2]):
		printerr("Kullanım: -- <ders: %s> <ilk_sayfa> <son_sayfa>" % ", ".join(CurriculumCheck.SUBJECT_SOURCES.keys()))
		quit(2)
		return
	var subject: String = args[0]
	var pages: Dictionary = CurriculumCheck.load_pages(CurriculumCheck.SUBJECT_SOURCES[subject]["file"])
	if pages.is_empty():
		printerr("Döküm bulunamadı: %s" % CurriculumCheck.SUBJECT_SOURCES[subject]["file"])
		quit(1)
		return
	var draft: Dictionary = OutcomeExtract.extract(pages, subject, int(args[1]), int(args[2]))
	var out_dir: String = "res://build/curriculum"
	DirAccess.make_dir_recursive_absolute(ProjectSettings.globalize_path(out_dir))
	var out_path: String = "%s/%s.draft.json" % [out_dir, subject]
	var f: FileAccess = FileAccess.open(out_path, FileAccess.WRITE)
	if f == null:
		printerr("Yazılamadı: %s" % out_path)
		quit(1)
		return
	f.store_string(JSON.stringify(draft, "\t", false) + "\n")
	f.close()
	print("%d kod çıkarıldı -> %s" % [draft.size(), out_path])
	quit()
