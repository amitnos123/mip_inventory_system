extends Node

export(int) var code
export(int) var generated_code
export(String) var itemName : String
export(PackedScene) var dropScene : PackedScene = load('res://Items/Item Test/Item Drop Test/item_drop_test.tscn') setget ,get_item_drop_node
export(PackedScene) var inventoryScene : PackedScene = load('res://Items/Item Test/Item Inventory Test/item_inventory_test.tscn') setget ,get_item_inventory_node

var item_data : Item

func _init():
	item_data = Item.new(code, generated_code, itemName, dropScene, inventoryScene)

func get_item_drop_node():
	var dropNode = dropScene.instance()
	dropNode.item_data = self.item_data
	return dropNode

func get_item_inventory_node():
	var inventoryNode = inventoryScene.instance()
	inventoryNode.item_data = self.item_data
	return inventoryNode
