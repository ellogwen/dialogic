tool
extends "res://addons/dialogic/Editor/Pieces/TimelineEventBase.gd"

func _init().('WaitSeconds'):
	event_label = 'Wait Seconds'
	event_data['wait_seconds'] =  0


func load_data(data):
	.load_data(data)
	$PanelContainer/VBoxContainer/Header/SpinBox.value = event_data['wait_seconds']


func _on_SpinBox_value_changed(value):
	event_data['wait_seconds'] = value
