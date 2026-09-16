extends Interactible

@onready var buttons = [$"../B1", $"../B2", $"../B3"]

func _ready() -> void:
	super ._ready()
	for button in buttons:
		#button.set_process(false)
		button.hide()
		button.process_mode = Node.PROCESS_MODE_DISABLED

func _interact_with(_item: ItemData) -> void:
	print("unlocking")
	for button in buttons:
		button.process_mode = Node.PROCESS_MODE_INHERIT
		#button.set_process(true)
		button.show()
	self.queue_free()
