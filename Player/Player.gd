extends KinematicBody2D

class_name Player

# Signal for when the player drops an item
signal item_drop(item_drop_node)

onready var inventory_node_path = $WindowsControler/WindowInventory
const SPEED = 200

# A basic movement for the demo
func _process(delta):
	var velocity = Vector2()  # The player's movement vector.
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	if velocity.length() > 0:
		velocity = velocity.normalized() * SPEED
	
	position += velocity * delta

# Triggers on dropping an item from the inventory
# @param {Node2D} item_drop_node - The item's drop node which is dropped from the inventory
# @returns {void}
func _on_window_inventory_item_drop(item_drop_node):
	drop_item(item_drop_node)

# Add an item to the player's inventory
# @param {Item} item_data - The item to add
# @returns {void}
func add_item(item_data : Item):
	inventory_node_path.add_item(item_data)

# General function for dropping items
# @param {Node2D} item_drop_node - The item's drop node which is dropped
# @param {Vector2} position - The position which the item will be dropped at
func drop_item(item_drop_node, position : Vector2 = self.position): 
	emit_signal('item_drop', item_drop_node, position)
