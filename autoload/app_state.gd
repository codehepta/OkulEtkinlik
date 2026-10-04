extends Node
## Uygulama durumu: etkin profil ve ekranlar arası geçiş.
## Sahneleri kendisi yönetir (scene_root altında tek ekran); testlerde scene_root değiştirilebilir.

const SCENES: Dictionary = {
	"splash": "res://scenes/ui/splash.tscn",
	"profile_select": "res://scenes/ui/profile_select.tscn",
	"profile_create": "res://scenes/ui/profile_create.tscn",
	"world_map": "res://scenes/ui/world_map.tscn",
	"region_path": "res://scenes/ui/region_path.tscn",
	"lesson": "res://scenes/ui/lesson_runner.tscn",
	"result": "res://scenes/ui/result.tscn",
	"album": "res://scenes/ui/sticker_album.tscn",
	"parent_gate": "res://scenes/ui/parent_gate.tscn",
	"parent_panel": "res://scenes/ui/parent_panel.tscn",
	"session_end": "res://scenes/ui/session_end.tscn",
}

## Etkin profil kimliği ("" = seçili profil yok).
var profile_id: String = ""
## Etkin profilin sınıfı (0 = bilinmiyor); SubtitleBubble okur.
var active_grade: int = 0
## Açılış ekranının logo bekleme süresi (sn); testlerde 0.
var splash_delay: float = 1.5

## Testlerde sahte düğümlerle değiştirilir.
var progress: Node = Progress
var session_timer: Node = SessionTimer
var narrator: Node = Narrator
var audio: Node = AudioDirector
var save: Node = SaveService
## Ekranların ekleneceği düğüm; boşsa get_tree().root.
var scene_root: Node = null

## Son başarısız goto'nun nedeni (dosya henüz yoksa); hata günlüğünü kirletmez.
var last_error: String = ""

var _current: Node = null
var _current_name: String = ""

func _ready() -> void:
	# Kayıtlı ses seviyelerini açılışta uygula.
	audio.apply_volumes(save.data["settings"] as Dictionary)

func current_scene_name() -> String:
	return _current_name

func current_scene() -> Node:
	return _current

## Ana sahne olarak açılan ekranı (Splash) AppState'e tanıtır; sonraki goto onu kaldırır.
func adopt_scene(scene_name: String, node: Node) -> void:
	_current = node
	_current_name = scene_name

func goto(scene: String, args: Dictionary = {}) -> void:
	if not SCENES.has(scene):
		push_error("AppState: bilinmeyen sahne: %s" % scene)
		return
	last_error = ""
	var path: String = str(SCENES[scene])
	if not ResourceLoader.exists(path):
		last_error = "sahne dosyası yok: %s" % path
		return
	var packed: PackedScene = load(path) as PackedScene
	var node: Node = packed.instantiate()
	if "app" in node:
		node.set("app", self)
	var host: Node = scene_root if scene_root != null else get_tree().root
	var use_root: bool = scene_root == null
	if is_instance_valid(_current):
		_current.queue_free()
	host.add_child(node)
	if use_root:
		get_tree().current_scene = node
	_current = node
	_current_name = scene
	if node.has_method("enter"):
		node.call("enter", args)

## Profili etkinleştirir, sınıfını ayarlar ve süre sayacını yeniden başlatır.
func select_profile(id: String) -> void:
	session_timer.stop()
	profile_id = id
	active_grade = 0
	for p: Dictionary in progress.profiles():
		if str(p["id"]) == id:
			active_grade = int(p["grade"])
	session_timer.start(id)

## Profil seçildikten ya da oluşturulduktan sonra: kilitliyse session_end, değilse world_map.
func enter_after_profile() -> void:
	if session_timer.is_locked(profile_id):
		goto("session_end")
	else:
		goto("world_map")
