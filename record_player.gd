extends Furniture

func _process(_delta: float) -> void:
	if len(gives) == 0:
		Enigmas.picked_vinyl = true
		queue_free()
