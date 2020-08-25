extends Node2D

# Trigger when dropping item on the ground
# @param {Node2D} item_drop_node - The item's drop node which is dropped
# @param {Vector2} position - The position which the item will be dropped at
func _on_item_drop(item_drop_node, position : Vector2):
	item_drop_node.position = position
	add_child(item_drop_node)
