extends Furniture

@onready var at_equilibrium = preload("res://assets/furniture/squirrel/scale_equilibrium.png")

func _interact_with(item: ItemData) -> void:
	if texture != at_equilibrium:
		texture = at_equilibrium
		ItemExchange.add_item.emit(preload("res://scissors.tres"))
