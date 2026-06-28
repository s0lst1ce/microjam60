extends Furniture

@onready var molten = preload("res://assets/furniture/candle_molten.png")

func _interact_with(item: ItemData) -> void:
	if item.name=="lighter":
		texture = molten
		ItemExchange.add_item.emit(preload("res://candle_key.tres"))
