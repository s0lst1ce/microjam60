extends Node2D

@onready var current_scene = preload("res://magpie_lounge_retro.tscn").instantiate()
@onready var mirror_scene = preload("res://magpie_lounge_future.tscn").instantiate()
@onready var period_button = $GUI/PeriodButton

func _ready() -> void:
	period_button.switch_period.connect(_on_switch_period)
	self.add_child(current_scene)
	

func _on_switch_period():
	self.add_child(mirror_scene)
	self.remove_child(current_scene)
	var tmp = current_scene
	current_scene = mirror_scene
	mirror_scene = tmp
