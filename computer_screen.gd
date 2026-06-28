extends PointLight2D

func _process(_delta: float) -> void:
	if !enabled and Enigmas.tv_on:
		enabled = true
