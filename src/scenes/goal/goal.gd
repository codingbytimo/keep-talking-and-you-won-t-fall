extends Node2D

signal goal_reached

func _ready() -> void:
	$AnimatedSprite2D.play("default")

func _on_area_2d_area_entered(area: Area2D) -> void:
	goal_reached.emit()
