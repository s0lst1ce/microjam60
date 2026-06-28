extends Furniture

@onready var opened = preload("res://assets/furniture/squirrel/acorn_chest_open.png")

func _interact_with(item: ItemData) -> void:
	texture = opened
	ItemExchange.add_item.emit("res://assets/furniture/shirt_button_wrong.png")
