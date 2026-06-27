extends Panel

@onready var icon: TextureRect = $Icon
@export var item: ItemData

func _ready() -> void:
	update_ui()
	
func update_ui():
	if not item:
		icon.texture=null
	else:
		icon.texture = item.icon
		tooltip_text = item.name


func _get_drag_data(at_position: Vector2) -> Variant:
	if not item:
		return
		
	var preview = duplicate()
	var c = Control.new()
	c.add_child(preview)
	# half the size of a slot -> makes it centered
	preview.position -= Vector2(25,25)
	# trasparent background instead of the slot bg
	preview.self_modulate = Color.TRANSPARENT
	c.modulate = Color(c.modulate, 0.5)
	
	set_drag_preview(c)
	icon.hide()
	return self
	
func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	return true
	
func _drop_data(at_position: Vector2, data: Variant) -> void:
	var tmp = item
	item = data.item
	data.item=tmp
	data.icon.show()
	update_ui()
	data.update_ui()
	
	
