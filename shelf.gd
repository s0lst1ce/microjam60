extends Furniture


func _interact_with(item: ItemData) -> void:
	print(item.name)
	if item.name == "branch":
		ItemExchange.add_item.emit(load("res://tabouret.tres"))
