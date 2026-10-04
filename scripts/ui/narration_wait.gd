extends RefCounted
## Bir anlatım satırını okutur ve bitmesini bekler (zaman aşımlı; satır yoksa takılmaz).

static func say(host: Node, narrator: Node, id: String, timeout: float = 6.0) -> void:
	var state: Dictionary = {"done": false}
	var cb: Callable = func(finished_id: String) -> void:
		if finished_id == id:
			state["done"] = true
	narrator.line_finished.connect(cb)
	narrator.say(id)
	var waited: float = 0.0
	while not bool(state["done"]) and waited < timeout and is_instance_valid(host) and host.is_inside_tree():
		await host.get_tree().process_frame
		if not is_instance_valid(host):
			break
		waited += host.get_process_delta_time()
	if is_instance_valid(narrator) and narrator.line_finished.is_connected(cb):
		narrator.line_finished.disconnect(cb)
