extends Control

@export_file("*.tscn") var gameplay_path: String

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file(gameplay_path)
