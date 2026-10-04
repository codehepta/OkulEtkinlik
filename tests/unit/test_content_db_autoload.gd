extends GutTest
## Gerçek ContentDB autoload'u açılışta içeriği yüklemiş olmalı (cihazda "yakında" kalmasın).

func test_singleton_loaded_real_content_at_boot() -> void:
	var db: Node = get_tree().root.get_node("ContentDB")
	assert_false(db.node("g1.matematik.u01.n01").is_empty(), "ilk durak yüklü")
	assert_gte(db.units(1, "matematik").size(), 1)
	assert_eq(db.errors, [] as Array[String], "gerçek içerik hatasız")
