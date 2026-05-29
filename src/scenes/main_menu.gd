extends Control

@onready var main_objects: Control = $MainObjects
@onready var tutorial_panel: Panel = $TutorialPanel
@onready var host_panel: Panel = $HostPanel
@onready var join_panel: Panel = $JoinPanel

@onready var ip_addresst_line_edit: LineEdit = $JoinPanel/VBoxContainer/VBoxContainer/IPAddresstLineEdit

@onready var join_port_line_edit: LineEdit = $JoinPanel/VBoxContainer/VBoxContainer2/PortLineEdit
@onready var host_port_line_edit: LineEdit = $HostPanel/VBoxContainer/PortLineEdit

@export_file("*.tscn") var host_waiting_scene_path: String
@export_file("*.tscn") var client_joining_scene_path: String

const MAX_PORT: int = 65535

func hide_main_objects() -> void:
	main_objects.hide()
	
func show_main_objects() -> void:
	main_objects.show()

func _on_tutorial_button_pressed() -> void:
	hide_main_objects()
	tutorial_panel.show()

func _on_close_tutorial_button_pressed() -> void:
	show_main_objects()
	tutorial_panel.hide()

func _on_close_host_panel_button_pressed() -> void:
	show_main_objects()
	host_panel.hide()

func _on_close_join_button_pressed() -> void:
	show_main_objects()
	join_panel.hide()

func _on_host_button_pressed() -> void:
	hide_main_objects()
	host_panel.show()

func _on_join_button_pressed() -> void:
	hide_main_objects()
	join_panel.show()

func _on_port_text_changed(new_text: String) -> void:
	var old_caret_colomn = max(host_port_line_edit.caret_column, join_port_line_edit.caret_column)
	var regex: RegEx = RegEx.new()
	var clean_port: String = ""
	regex.compile("[0-9]")
	var difference: int = regex.search_all(new_text).size()-new_text.length()
	for valid_digit in regex.search_all(new_text):
		clean_port += valid_digit.get_string()
	join_port_line_edit.text = clean_port
	host_port_line_edit.text = clean_port
	host_port_line_edit.caret_column = old_caret_colomn + difference
	join_port_line_edit.caret_column = old_caret_colomn + difference

func _on_host_game_button_pressed() -> void:
	if host_port_line_edit.text.to_int() > MAX_PORT:
		return

	NetworkHandler.port = host_port_line_edit.text.to_int()
	NetworkHandler.server_start()
	get_tree().change_scene_to_file(host_waiting_scene_path)
	

func _on_join_game_button_pressed() -> void:
	if join_port_line_edit.text.to_int() > MAX_PORT:
		return
	
	NetworkHandler.ip_address = ip_addresst_line_edit.text
	NetworkHandler.port = join_port_line_edit.text.to_int()
	NetworkHandler.client_start()
	get_tree().change_scene_to_file(client_joining_scene_path)
