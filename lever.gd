extends Furniture

@onready var on_texture = preload("res://assets/furniture/squirrel/lever_off.png")

func _on_click() -> void:
	if texture != on_texture and Enigmas.bedroom_flushed:
		texture = on_texture
		Enigmas.tv_on = true
