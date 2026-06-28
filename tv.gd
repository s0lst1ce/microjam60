extends Sprite2D

@onready var turned_on_texture = preload("res://assets/furniture/tv_image.png")
@onready var buttons = [$"../TvColoredButton1", $"../TvColoredButton2", $"../TvColoredButton3", $"../TvColoredButton4"]

func _ready() -> void:
	for button in buttons:
		button.set_process(false)
		button.hide()


func _process(delta: float) -> void:
	if Enigmas.tv_on and turned_on_texture != texture:
		texture = turned_on_texture
		for button in buttons:
			button.set_process(true)
			button.show()
