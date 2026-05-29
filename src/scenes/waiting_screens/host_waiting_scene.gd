extends Control

@export_file("*.tscn") var gameplay_path: String
const text: String = "Waiting for Player"
var dot_count: int = 0

func _ready() -> void:
	NetworkHandler.player_joined.connect(_player_connected)

func _on_timer_timeout() -> void:
	dot_count = (dot_count + 1) % 4
	$Label.text = text + ".".repeat(dot_count)

func _player_connected() -> void:
	print("Player connected to Host")
	get_tree().change_scene_to_file(gameplay_path)
