tool
extends "res://addons/dialogic/Editor/Pieces/TimelineEventBase.gd"

func _init().('EndBranch'):
	event_label = 'End Branch'
	event_data['endbranch'] = ''


func load_data(data):
	.load_data(data)
