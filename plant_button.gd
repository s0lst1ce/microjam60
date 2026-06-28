extends Furniture

func _process(delta: float) -> void:
	if Enigmas.plant_dead:
		ItemExchange.add_item.emit(preload("res://assets/furniture/shirt_button_orange.png"))
		queue_free()
