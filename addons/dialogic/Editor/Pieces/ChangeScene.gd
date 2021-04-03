tool
extends "res://addons/dialogic/Editor/Pieces/TimelineEventBase.gd"


func _init().('ChangeScene'):
	event_label = 'Change Scene'
	event_data['change_scene'] = ''


func _on_ButtonScenePicker_pressed():
	editor_reference.godot_dialog("*.tscn")
	editor_reference.godot_dialog_connect(self, "_on_file_selected")


func _on_file_selected(path, target):
	target.select_scene(path)


func select_scene(path):
	$PanelContainer/VBoxContainer/Header/Name.text = path
	event_data['change_scene'] = path


func load_data(data):
	.load_data(data)
	if data['change_scene'] != '':
		select_scene(data['change_scene'])
