extends TextureRect

class_name ItemInventory

signal _on_dragged(container_id)
signal _on_stop_drag(container_id)

var item_data : Item = null setget set_item_data, get_item_data
onready var is_mouse_over_window = false
onready var is_dragged = false

func _ready():
	connect('_on_dragged', get_parent(), '_on_ItemInventory_dragged')
	connect('_on_stop_drag', get_parent(), '_on_ItemInventory_stop_drag')

func _input(event):
	if event is InputEventMouseButton:
		if !event.pressed && is_dragged:
			is_dragged = false
			emit_signal("_on_stop_drag", get_parent().container_id)

func get_drag_data(_pos):
	if item_data == null:
		return null
	
	emit_signal("_on_dragged", get_parent().container_id)
	is_dragged = true
	
	var tr = TextureRect.new()
	tr.texture = self.texture
	tr.rect_size = self.rect_size
	tr.expand = true
	set_drag_preview(tr)
	
	return get_parent()

func can_drop_data(_pos, data):
	#return (data is Item)
	return (data is ItemContainer)

func drop_data(_pos, item_container):
	var item_inventory = item_container.get_child(0)
	var item_inventory_duplicate = item_inventory.duplicate()
	
	self.get_parent().selected = false
	item_container.selected = false
	
	item_inventory.replace_by(self.duplicate())
	replace_by(item_inventory_duplicate)

func set_item_data(value):
	item_data = value
	var inventoryScene = value.inventory_scene.instance()
	replace_by(inventoryScene, true)

func get_item_data():
	return item_data

func remove_item():
	var emptyItemInventory = load('res://Items/Item Inventory/item_inventory.tscn')
	replace_by(emptyItemInventory.instance(), false)
