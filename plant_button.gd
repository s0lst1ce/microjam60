extends Furniture

func _on_click() -> void:
	if Enigmas.plant_dead:
		ItemExchange.add_item.emit(preload("res://shirt_button_orange.tres"))
		queue_free()
