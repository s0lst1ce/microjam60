extends Furniture

@onready var open = preload("res://assets/furniture/trapdoor_open.png")

func _interact_with(item: ItemData) -> void:
	texture = open
#	ItemExchange.add_item.emit(preload("res://screwdriver.tres"))
