extends Control

@export_file("*.tscn") var gameplay_path: String

func _ready() -> void:
	if !multiplayer.is_server():
		$Button.disabled = true

func _on_button_pressed() -> void:
	change_scene.rpc()

@rpc("authority", "call_local", "reliable", 0)
func change_scene() -> void:
	get_tree().change_scene_to_file(gameplay_path)
