tool
extends Control

var editor_reference
func get_editor_reference(): return editor_reference

var editorPopup
func get_editor_popup(): return editorPopup

# this is the internal typename of the event like TextBlock or SetValue
var event_type = ''
func get_event_type(): return event_type

# this is the label of this event, for buttons or panels like "Text Block" or "Set Value"
var event_label = ''
func get_event_label(): return event_label

# this is a description of what the event does to guide the user how to use it
var event_description = ''
func get_event_description(): return event_description

# This is the information of this event and it will get parsed and saved to the JSON file.
var event_data = { }
func get_event_data(): return event_data


func _init(type):
	event_type = type
	event_label = type
	
	if (type == ''):
		push_error("[Dialogic] Do not initalize a timeline event with an empty type")
	
	# store the event type within the event data
	event_data['event_type'] = event_type


# loads the event_data
# extend me to handle loading
func load_data(data):
	if (data == null):
		push_error("[Dialogic] null event data in load_data")
		data = {}
	if (not data.has("event_type")):
		push_warning("[Dialogic] missing event_type in load_data, adding it")
		data['event_type'] = event_type
	elif(data['event_type'] != event_type):
		push_error("[Dialogic] you are trying to load data of event type %s in an %s event node" % [ data['event_type'], event_type ])
	event_data = data
	pass


# @Virtual
# @Lifecycle Callback
# gets called when the user selects this event at the timeline
func on_timeline_selected(): pass

# @Virtual
# @Lifecycle Callback
# gets called when this event at timeline gets deselected
func on_timeline_deselected(): pass

# @Virtual
# @Lifecycle Callback
# gets called when this event gets added to the timeline
func on_timeline_added(): pass

# @Virtual
# @Lifecycle Callback
# gets called when this event gets removed from the timeline
func on_timeline_removed(): pass

# @Virtual
# @Lifecycle Callback
# gets called when this event gets moved within the timeline
func on_timeline_moved(from_position, to_position): pass
