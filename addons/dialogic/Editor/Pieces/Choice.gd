tool
extends "res://addons/dialogic/Editor/Pieces/TimelineEventBase.gd"


func _init().('Choice'):
	event_label = 'Choice'
	event_data['choice'] = ''


func _ready():
	$PanelContainer/VBoxContainer/Header/Warning.visible = false
	$PanelContainer/VBoxContainer/Header/CustomLineEdit.connect('text_changed', self, '_on_LineEdit_text_changed')
	pass


func load_data(data):
	.load_data(data)
	$PanelContainer/VBoxContainer/Header/CustomLineEdit.text = event_data['choice']


func _on_LineEdit_text_changed(new_text):
	event_data['choice'] = new_text


func _on_Indent_visibility_changed():
	$PanelContainer/VBoxContainer/Header/Warning.visible = !$Indent.visible
