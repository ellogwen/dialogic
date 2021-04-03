tool
extends "res://addons/dialogic/Editor/Pieces/TimelineEventBase.gd"

var character_selected = ''


func _init().('CharacterLeaveBlock'):
	event_label = 'Character Leave'
	event_data['action'] = 'leaveall'
	event_data['character'] = '[All]'


func _ready():
	$PanelContainer/VBoxContainer/Header/CharacterDropdown.get_popup().connect("index_pressed", self, '_on_character_selected')


func _on_CharacterDropdown_about_to_show():
	var Dropdown = $PanelContainer/VBoxContainer/Header/CharacterDropdown
	Dropdown.get_popup().clear()
	Dropdown.get_popup().add_item("[All]")
	var index = 1
	for c in DialogicUtil.get_sorted_character_list():
		Dropdown.get_popup().add_item(c['name'])
		Dropdown.get_popup().set_item_metadata(index, {'file': c['file'], 'color': c['color']})
		index += 1


func _on_character_selected(index):
	var text = $PanelContainer/VBoxContainer/Header/CharacterDropdown.get_popup().get_item_text(index)
	var metadata = $PanelContainer/VBoxContainer/Header/CharacterDropdown.get_popup().get_item_metadata(index)
	$PanelContainer/VBoxContainer/Header/CharacterDropdown.text = text
	if (metadata.has('file')):
		event_data['character'] = metadata['file']


func load_data(data):
	.load_data(data)
	if data['character'] != '[All]':
		if data['character'] != '':
			var character_data = DialogicResources.get_character_json(data['character'])
			if character_data.has('name'):
				$PanelContainer/VBoxContainer/Header/CharacterDropdown.text = character_data['name']
