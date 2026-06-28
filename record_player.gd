extends Furniture

func _process(delta: float) -> void:
	if len(gives) == 0:
		queue_free()
