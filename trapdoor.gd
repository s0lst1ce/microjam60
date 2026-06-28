extends Furniture

var open = false
@onready var open_texture = preload("res://assets/furniture/trapdoor_open.png")

func _interact_with(item: ItemData) -> void:
	texture = open_texture
	open = true
	ItemExchange.add_item.emit(preload("res://screwdriver.tres"))

func _on_click() -> void:
	if open:
		SceneSwitching.goto_room.emit("squirrel")
