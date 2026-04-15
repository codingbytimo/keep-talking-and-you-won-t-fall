extends Node2D

@export_file("*.tscn") var death_screen_path: String

func _on_death_layer_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_file(death_screen_path)
