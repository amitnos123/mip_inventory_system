extends StateMachine

func _ready():
	states_map = {
		"drop": $Drop,
		"picked": $Picked,
		"despawn": $Despawn,
	}

func _change_state(state_name):
	._change_state(state_name)

func _physics_process(delta):
	._physics_process(delta)

func _input(event):
	current_state.handle_input(event)

func _on_animation_finished():
	current_state._on_animation_finished()
