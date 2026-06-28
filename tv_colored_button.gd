class_name TvColoredButton extends Furniture

@export var order: int
@onready var red = preload("res://assets/furniture/pillow_button_red.png")
@onready var orange = preload("res://assets/furniture/pillow_button_orange.png")
@onready var green = preload("res://assets/furniture/pillow_button_green.png")
@onready var purple = preload("res://assets/furniture/pillow_button_pink.png")

func _ready() -> void:
	set_color(Enigmas.ColorState.RED)

func color_to_texture(color: Enigmas.ColorState):
	match color:
		Enigmas.ColorState.RED: return red
		Enigmas.ColorState.ORANGE: return orange
		Enigmas.ColorState.GREEN: return green
		Enigmas.ColorState.PURPLE: return purple

func _on_click() -> void:
	set_color(Enigmas.next_color(Enigmas.tv_buttons[order]))

func set_color(color: Enigmas.ColorState):
	Enigmas.tv_buttons[order] = color
	texture = color_to_texture(Enigmas.tv_buttons[order])
