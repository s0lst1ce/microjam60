extends Sprite2D

@onready var on_texture = preload("res://assets/furniture/squirrel/cathodic_tv_on.png")
@onready var screen = $Screen

func _process(_delta: float) -> void:
	if Enigmas.tv_on and texture != on_texture:
		texture = on_texture
		screen.show()
