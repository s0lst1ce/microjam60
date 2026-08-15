extends TextureRect

class_name Furniture
@export var interacts_with: Array[String]
@export var gives: Array[ItemData] = []

@export var walk_to: Polygon2D

func _ready() -> void:
	if interacts_with == null or walk_to == null:
		push_error("Both `interact_with` and `walk_to` Marker must be set on a furniture")
		queue_free()

func _can_drop_data(_at_position: Vector2, _data: Variant) -> bool:
	#TODO check collision with polygon instead of rect ? WARN: do not use walk_to polygon as interactible poly & walk to poly may be different (ex: tree)
	return true

func _interact_with(_item: ItemData) -> void:
	pass

func _drop_data(_at_position: Vector2, data: Variant) -> void:
	if data.item.name in interacts_with:
		print(data.item, " is interacting with ", self)
		ItemExchange.walk_to.emit(walk_to.global_position, self)
		print("sending player to ", walk_to.global_position)
		ItemExchange.prepare_use_item.emit(data)
		#_interact_with(data.item)
		#data.item = null
		#data.update_ui()

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("click") and get_rect().has_point(get_global_mouse_position()):
		print("clicked on ", self, " moving player to ", walk_to.global_position)
		get_viewport().set_input_as_handled()
		ItemExchange.walk_to.emit(walk_to.global_position, self)

func empty_handed_interaction():
		if len(gives) > 0:
			print("giving items")
			for item in gives:
				ItemExchange.add_item.emit(item)
			gives.clear()

		else:
			print("empty-hand interaction")
			_on_click()

func _on_click() -> void:
	pass
