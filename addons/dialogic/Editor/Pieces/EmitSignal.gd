tool
extends "res://addons/dialogic/Editor/Pieces/TimelineEventBase.gd"


func _init().('EmitSignal'):
	event_label = 'Emit Signal'
	event_data['emit_signal'] = ''


func load_data(data):
	.load_data(data)
	$PanelContainer/VBoxContainer/Header/LineEdit.text = event_data['emit_signal']


func _on_LineEdit_text_changed(new_text):
	event_data['emit_signal'] = new_text
