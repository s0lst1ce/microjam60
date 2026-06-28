extends Sprite2D

func _process(_delta: float) -> void:
	if Enigmas.is_metal_tree_valid() and !Enigmas.metal_tree_reward_taken:
		Enigmas.metal_tree_reward_taken = true
		ItemExchange.add_item.emit(preload("res://wrench.tres"))
		ItemExchange.add_item.emit(preload("res://shirt_button_purple.tres"))
