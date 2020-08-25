extends Area2D

class_name ItemDrop

signal picked(item_data)

var item_data : Item = null

onready var player_in_area : Player = null

func _on_ItemDrop_body_entered(body):
	if body is Player:
		player_in_area = body
		connect('picked', player_in_area, 'add_item')

func _on_ItemDrop_body_exited(body):
	if body is Player:
		player_in_area = null
		disconnect('picked', player_in_area, 'add_item')
