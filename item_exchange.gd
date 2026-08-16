extends Node

@warning_ignore_start("unused_signal")

signal add_item(item: ItemData)
signal can_give(furniture)
signal walk_to(pos: Vector2, furniture: Furniture)
signal prepare_use_item(data: Variant)

@warning_ignore_restore("unused_signal")
