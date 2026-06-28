extends Furniture

@onready var broken = preload("res://assets/furniture/broken_box.png")

func _interact_with(item: ItemData) -> void:
	texture = broken
	ItemExchange.add_item.emit(preload("res://screwdriver.tres"))
