extends Furniture


func _interact_with(item: ItemData) -> void:
	self.queue_free()
