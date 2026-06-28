extends Furniture

@onready var opened = preload("res://assets/furniture/opened_chest.png")

func _interact_with(item: ItemData) -> void:
	if item.name == "chest_key":
		texture = opened
		ItemExchange.add_item.emit(preload("res://stone.tres"))
		ItemExchange.add_item.emit(preload("res://saw.tres"))
		ItemExchange.add_item.emit(preload("res://lighter.tres"))
