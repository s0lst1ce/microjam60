extends Furniture


func _interact_with(item: ItemData) -> void:
	ItemExchange.add_item.emit(load("res://tabouret.tres"))
