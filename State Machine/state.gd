extends Node

class_name State

signal finished(next_state_name)

# Called when entering\starting the current state
# Initialize the state. E.g. change the animation
# @returns {void}
func enter():
	return

# Called when finishing\existing the current state to another state
# Clean up the state. Reinitialize values like a timer
# @returns {void}
func exit():
	return

# Triggers get a input, and will only do it for the current state.
# @param {InputEvent} event - The client's input
# @returns {void}
func handle_input(event):
	return
	
# Function for _physics_process for the state, which is called only if the state is the current state
# @param {float} delta - The time between frames. The same delta from _physics_process.
# @returns {void}
func update(delta):
	return
	
# Triggers when on the state and the animation is finished
# @returns {void}
func _on_animation_finished():
	return
