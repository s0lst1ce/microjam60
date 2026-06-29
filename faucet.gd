extends Furniture

@onready var repaired = preload("res://assets/furniture/faucet.png")
@onready var filled_once = false

func _interact_with(item: ItemData) -> void:
	if item.name == "wrench" and texture != repaired:
		texture = repaired
		Enigmas.bedroom_flushed = true
	elif item.name == "glass":
		if filled_once:
			ItemExchange.add_item.emit(preload("res://glass.tres"))
		else:
			filled_once = true
			ItemExchange.add_item.emit(preload("res://glass_water.tres"))
	elif item.name == "kettle":
		ItemExchange.add_item.emit(preload("res://boiling_water.tres"))
