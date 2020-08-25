extends ItemInventory

export(int) var code
export(int) var generated_code
export(String) var itemName : String
export(PackedScene) var dropScene : PackedScene = load('res://Items/Item Test/Item Drop Test/item_drop_test.tscn')
export(PackedScene) var inventoryScene : PackedScene = load('res://Items/Item Test/Item Inventory Test/item_inventory_test.tscn')

func _init():
	item_data = Item.new(code, generated_code, itemName, dropScene, inventoryScene)
