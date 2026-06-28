extends Room

@onready var background = $Background
@onready var normal_room = preload("res://assets/squirrel_bedroom_future.png")
@onready var link = $DeskFloorLink
@onready var furnitures = $Furnitures

func _ready() -> void:
	furnitures.hide()
	furnitures.set_process(false)
	link.enabled=false

func _process(delta: float) -> void:
	if Enigmas.bedroom_flushed and normal_room != background.texture:
		unflood()

func unflood() -> void:
	furnitures.set_process(true)
	furnitures.show()
	link.enabled=true
	background.texture = normal_room
