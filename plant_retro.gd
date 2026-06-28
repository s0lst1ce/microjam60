extends Furniture

@onready var cut = preload("res://assets/furniture/squirrel/plant_killed.png")

func _interact_with(item: ItemData) -> void:
	if texture != cut:
		texture = cut
		Enigmas.plant_dead = true
