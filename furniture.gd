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
		_interact_with(data.item)
		data.item = null
		data.update_ui()

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("click") and get_rect().has_point(get_global_mouse_position()):
		print("clicked on ", self)
		if len(gives) != 0:
			print("giving items")
			ItemExchange.can_give.emit(self)
		else:
			print("empty-hand interaction")
			_on_click()

func _on_click() -> void:
	pass
