tool
extends Control

class_name Window, 'res://Window/window_icon.png'

signal move_to_top

export var DEFAULT_LABEL_TEXT = 'label'

onready var label_text setget set_label, get_label
onready var label_node_path = $WindowContainer/WindowBackground/Label
onready var drag_position : Vector2 = Vector2.ZERO
onready var mouse_in_window : Window = null

func _ready():
	self.label_text = DEFAULT_LABEL_TEXT

func set_label(value):
	label_node_path.text = value

func get_label():
	return label_node_path.text

# Called when the close button is pressed
# @param {InputEvent} event - The client's gui input
# @returns {void}
func _on_close_button_pressed():
	self.set_visible(false)

# Called when the label is pressed
# @param {InputEvent} event - The client's gui input
# @returns {void}
func _on_click_label_alert_gui_input(event):
	drag_window(event)

# Called when there is an GUI input in the window container
# @param {InputEvent} event - The client's gui input
# @returns {void}
func _on_window_container_gui_input(event):
	drag_window(event)

# Called when there is an GUI input in the window background
# @param {InputEvent} event - The client's gui input
# @returns {void}
func _on_window_background_gui_input(event):
	drag_window(event)

# Called when there is an GUI input anywhere in the window
# @param {InputEvent} event - The client's gui input
# @returns {void}
func drag_window(event):
	if event is InputEventMouseButton:
		if event.pressed && event.button_index == BUTTON_LEFT:
			drag_position = get_local_mouse_position()
			emit_signal('move_to_top', self)
		else:
			drag_position = Vector2.ZERO
			
	if event is InputEventMouse and drag_position.length() != 0:
		rect_global_position += get_local_mouse_position() - drag_position

# Called when there is a change in which window the mouse is in
# @param {Window} window_node - The window's node
# @returns {void}
func _on_mouse_change_window(window_node : Window):
	mouse_in_window = window_node
	emit_signal('mouse_change_window', window_node)
