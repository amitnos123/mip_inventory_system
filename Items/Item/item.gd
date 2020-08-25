extends Node
#Class for saving the metadata of an item
class_name Item

onready var code : int = 0
onready var generated_code : int = 0
onready var item_name : String = ''
onready var drop_scene : PackedScene
onready var inventory_scene : PackedScene

func _init(code : int, generated_code : int, item_name : String, drop_scene : PackedScene, inventory_scene : PackedScene):
	self.code = code
	self.generated_code = generated_code
	self.item_name = item_name
	self.drop_scene = drop_scene
	self.inventory_scene = inventory_scene
