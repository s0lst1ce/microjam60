extends Panel

@onready var grid_container: GridContainer = $"./MarginContainer/GridContainer"

const HAND_CLOSED = preload("res://assets/cursors/hand_closed.svg")
const HAND_POINT = preload("res://assets/cursors/hand_point.svg")


func _ready() -> void:
	Input.set_custom_mouse_cursor(HAND_POINT, Input.CURSOR_ARROW)
	Input.set_custom_mouse_cursor(HAND_CLOSED, Input.CURSOR_FORBIDDEN)
	Input.set_custom_mouse_cursor(HAND_CLOSED, Input.CURSOR_CAN_DROP)
	Input.set_custom_mouse_cursor(HAND_CLOSED, Input.CURSOR_DRAG)
	
	ItemExchange.add_item.connect(_on_add_item)

#func _process(delta: float) -> void:
#	if Input.get_current_cursor_shape() == CURSOR_FORBIDDEN:
#		DisplayServer.cursor_set_shape(DisplayServer.CURSOR_ARROW)
		
var data_bk
func _notification(what: int) -> void:
	if what == Node.NOTIFICATION_DRAG_BEGIN:
		data_bk = get_viewport().gui_get_drag_data()
	if what == Node.NOTIFICATION_DRAG_END:
		if data_bk:
			data_bk.icon.show()
			data_bk = null

func _on_add_item(item: ItemData):
	for slot in grid_container.get_children():
		if slot.item == null:
			slot.item = item
			slot.update_ui()
			return
	assert(false)
