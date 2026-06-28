extends Sprite2D

@onready var empty = preload("res://assets/furniture/squirrel/pot.png")

func _process(_delta: float) -> void:
	if Enigmas.plant_dead and texture != empty:
		texture = empty
