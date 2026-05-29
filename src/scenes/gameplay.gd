extends Node2D

@export_file("*.tscn") var death_screen_path: String
@export_file("*.tscn") var victory_screen_path: String

func _on_death_layer_body_entered(body: Node2D) -> void:
	call_deferred("change_to_death_scene")

func change_to_death_scene() -> void:
	get_tree().change_scene_to_file(death_screen_path)
	
func change_to_victory_scene() -> void:
	get_tree().change_scene_to_file(victory_screen_path)


func _on_goal_goal_reached() -> void:
	call_deferred("change_to_victory_scene")
