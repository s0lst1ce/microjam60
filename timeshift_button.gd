extends TextureButton

@export var retro: bool = true
signal switch_period

func _on_pressed() -> void:
	retro = !retro
	var tmp = texture_normal
	texture_normal = texture_pressed
	texture_pressed = tmp
	switch_period.emit()
