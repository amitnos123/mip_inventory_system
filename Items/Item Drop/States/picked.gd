extends State

func enter():
	owner.get_node("Animation").play("picked")
	owner.emit_signal('picked', owner.item_data)
	return

func _on_animation_finished():
	owner.queue_free()
	return
