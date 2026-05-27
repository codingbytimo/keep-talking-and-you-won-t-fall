extends Control

@onready var multiplayer_menu: VBoxContainer = $MultiplayerMenu

func _on_host_button_pressed() -> void:
	multiplayer_menu.hide()
	NetworkHandler.server_start()



func _on_join_button_pressed() -> void:
	multiplayer_menu.hide()
	NetworkHandler.client_start()
