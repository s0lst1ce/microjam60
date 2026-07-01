extends PointLight2D

@onready var on = false

func _ready() -> void:
	hide()

func _process(_delta: float) -> void:
	if !on and Enigmas.tv_on:
		on = true
		show()
