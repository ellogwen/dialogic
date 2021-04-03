tool
extends "res://addons/dialogic/Editor/Pieces/TimelineEventBase.gd"

func _init().('CloseDialog'):
	event_label = 'Close Dialog'
	event_data['close_dialog'] = ''


func _ready():
	pass


func load_data(data):
	.load_data(data)
