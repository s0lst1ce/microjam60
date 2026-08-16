extends Furniture

func _interact_with(_item: ItemData) -> void:
	ItemExchange.add_item.emit(preload("res://branch.tres"))
	self.queue_free()
