tool
extends "res://addons/dialogic/Editor/Pieces/TimelineEventBase.gd"

func _init().('IfCondition'):
	event_label = 'If Condition'
	event_data['condition'] = '=='
	event_data['definition'] = ''
	event_data['value'] = ''


onready var nodes = {
	'definition_picker': $PanelContainer/VBoxContainer/Header/DefinitionPicker,
	'condition_picker': $PanelContainer/VBoxContainer/Header/ConditionPicker,
}

func _ready():
	nodes['definition_picker'].get_popup().connect("index_pressed", self, '_on_definition_entry_selected')
	nodes['condition_picker'].get_popup().connect("index_pressed", self, '_on_condition_entry_selected')
	$PanelContainer/VBoxContainer/Header/CustomLineEdit.connect("text_changed", self, '_on_text_changed')


func _on_text_changed(new_text):
	event_data['value'] = new_text


func load_data(data):
	.load_data(data)
	$PanelContainer/VBoxContainer/Header/CustomLineEdit.text = event_data['value']
	nodes['definition_picker'].load_definition(data['definition'])
	nodes['condition_picker'].load_condition(data['condition'])


func _on_definition_entry_selected(index):
	var metadata = nodes['definition_picker'].get_popup().get_item_metadata(index)
	event_data['definition'] = metadata['id']


func _on_condition_entry_selected(index):
	var metadata = nodes['condition_picker'].get_popup().get_item_metadata(index)
	event_data['condition'] = metadata['condition']
