extends TextureRect

@export var interacts_with: Array[String]
@onready var inventory: Panel = $"../GUI/Inventory"
@export var gives: Array[ItemData]

func _ready() -> void:
	if interacts_with == null:
		queue_free()

func _can_drop_data(_at_position: Vector2, _data: Variant) -> bool:
	#TODO check collision
	return true
	
func _drop_data(at_position: Vector2, data: Variant) -> void:
	if data.item.name in interacts_with:
		#TODO wether or not this opeation the item
		data.item = null
		inventory.add_item(load("res://branch.tres"))
		data.update_ui()
