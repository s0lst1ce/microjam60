extends Furniture

@onready var buttons = [$"../B1", $"../B2", $"../B3"]

func _ready() -> void:
	for button in buttons:
		button.set_process(false)
		button.hide()

func _interact_with(item: ItemData) -> void:
	for b in buttons:
		var button = get_node(b)
		button.set_process(true)
		button.show()
	self.queue_free()
