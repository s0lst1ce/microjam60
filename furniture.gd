extends TextureRect

class_name Furniture
@export var interacts_with: Array[String]
@export var gives: Array[ItemData] = []

func _ready() -> void:
	if interacts_with == null:
		queue_free()

func _can_drop_data(_at_position: Vector2, _data: Variant) -> bool:
	#TODO check collision with polygon instead of rect ?
	return true

func _interact_with(item: ItemData) -> void:
	pass

func _drop_data(_at_position: Vector2, data: Variant) -> void:
	if data.item.name in interacts_with:
		data.item = null
		data.update_ui()
		_interact_with(data.item)

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("click") and get_rect().has_point(get_global_mouse_position()):
		ItemExchange.can_give.emit(self)


func _on_button_pressed() -> void:
	pass # Replace with function body.
