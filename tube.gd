extends Furniture

@onready var filled = preload("res://assets/furniture/filled_tube.png")

func _interact_with(item: ItemData) -> void:
	texture = filled
	ItemExchange.add_item.emit(preload("res://glass.tres"))
	ItemExchange.add_item.emit(preload("res://tube_key.tres"))
