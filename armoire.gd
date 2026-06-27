extends TextureRect

@export var interacts_with: Array[String]
@export var gives: Array[ItemData] = []

func _ready() -> void:
	if interacts_with == null:
		queue_free()

func _can_drop_data(_at_position: Vector2, _data: Variant) -> bool:
	#TODO check collision
	return true

func _drop_data(at_position: Vector2, data: Variant) -> void:
	if data.item.name in interacts_with:
		data.item = null
		data.update_ui()
		ItemExchange.add_item.emit(load("res://branch.tres"))

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("click") and get_rect().has_point(get_global_mouse_position()):
		ItemExchange.can_give.emit(self)
