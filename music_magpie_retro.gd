extends AmbiantMusic

func _process(_delta: float) -> void:
	if Enigmas.picked_vinyl and stream != null:
		stream = null
		stop()
