extends Control

@export_file("*.tscn") var gameplay_path: String
const text: String = "Looking for Host"
var dot_count: int = 0

func _ready() -> void:
	NetworkHandler.joined_to_host.connect(_player_connected)

func _on_timer_timeout() -> void:
	dot_count = (dot_count + 1) % 4
	$Label.text = text + ".".repeat(dot_count)

func _player_connected() -> void:
	print("Client joined to Host")
	get_tree().change_scene_to_file(gameplay_path)
