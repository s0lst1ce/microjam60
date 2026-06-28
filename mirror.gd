extends Furniture

@onready var condensation = preload("res://assets/furniture/squirrel/mirror_condensation.png")
@onready var broken = preload("res://assets/furniture/squirrel/mirror_broken.png")

func _interact_with(item: ItemData) -> void:
	if item.name == "boiling_water" and texture != condensation:
		texture = condensation
	elif item.name == "record_player" and texture != broken:
		texture = broken
		ItemExchange.add_item.emit(preload("res://shirt_button_blue.tres"))
