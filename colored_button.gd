class_name ColoredButton extends Furniture

@export var order: int
@onready var red = preload("res://assets/furniture/red_button.png")
@onready var orange = preload("res://assets/furniture/orange_button.png")
@onready var green = preload("res://assets/furniture/green_button.png")
@onready var purple = preload("res://assets/furniture/purple_button.png")

func _ready() -> void:
	set_color(Enigmas.ColorState.RED)

func color_to_texture(color: Enigmas.ColorState):
	match color:
		Enigmas.ColorState.RED: return red
		Enigmas.ColorState.ORANGE: return orange
		Enigmas.ColorState.GREEN: return green
		Enigmas.ColorState.PURPLE: return purple

func _on_click() -> void:
	set_color(Enigmas.next_color(Enigmas.metal_buttons[order]))

func set_color(color: Enigmas.ColorState):
	Enigmas.metal_buttons[order] = color
	texture = color_to_texture(Enigmas.metal_buttons[order])
