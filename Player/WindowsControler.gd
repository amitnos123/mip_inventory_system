extends Control

signal mouse_change_window(window_node)

# The node which the mouse is on
onready var mouse_on_window = null
onready var windows_array = []

func _ready():
	var mouse_pos = get_global_mouse_position()
	for window in get_children():
		window.connect('move_to_top', self, '_on_move_window_to_top')
		connect('mouse_change_window', window, '_on_mouse_change_window')
		windows_array.push_back(window)

func _input(event):
	if event is InputEventMouseMotion:
		var in_window = false
		for window in windows_array:
			if window.visible:
				if(window.get_rect().has_point(event.position)):
					in_window = true
					if(mouse_on_window != window):
						mouse_on_window = window
						emit_signal('mouse_change_window', mouse_on_window)
		if not in_window && mouse_on_window != null:
			mouse_on_window = null
			emit_signal('mouse_change_window', mouse_on_window)

func _on_move_window_to_top(window):
	move_child(window, get_child_count() - 1)

func add_window(window : Window):
	window.connect('move_to_top', self, '_on_move_window_to_top')
	connect('mouse_change_window', window, '_on_mouse_change_window')
	
	if window is WindowInventory:
		window.connect('item_drop', owner, '_on_window_inventory_item_drop')
	
	windows_array.push_back(window)
	add_child(window)
