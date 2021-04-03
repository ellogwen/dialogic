tool
extends "res://addons/dialogic/Editor/Pieces/TimelineEventBase.gd"

func _init().('Question'):
	event_label = 'Question'
	event_data['question'] = ''
	event_data['options'] = []


func load_data(data):
	.load_data(data)
	$PanelContainer/VBoxContainer/Header/LineEdit.text = event_data['question']


func _on_LineEdit_text_changed(new_text):
	event_data['question'] = new_text
