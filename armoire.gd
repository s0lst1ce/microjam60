extends TextureRect

@export var interacts_with: Array[String]
@onready var inventory: Panel = $"../GUI/Inventory"

func _ready() -> void:
	if interacts_with == null:
		queue_free()

func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	#TODO check collision
	return true
	
func _drop_data(at_position: Vector2, data: Variant) -> void:
	print(inventory)
	if data.item.name in interacts_with:
		print("can drop ", data.item.name)
		#TODO wether or not this opeation the item
		data.item = null
		data.update_ui()
		
