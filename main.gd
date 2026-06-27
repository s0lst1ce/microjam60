extends Node2D

@onready var current_room: String = "magpie"
@onready var current_period: int = 0
@onready var period_button = $GUI/PeriodButton

@onready var scenes = {
	"magpie": [preload("res://magpie_lounge_retro.tscn").instantiate(), preload("res://magpie_lounge_future.tscn").instantiate()],
	"squirrel": [preload("res://squirrel_bedroom_retro.tscn").instantiate(), preload("res://squirrel_bedroom_future.tscn").instantiate()]
}

func _ready() -> void:
	period_button.switch_period.connect(_on_switch_period)
	SceneSwitching.goto_room.connect(_on_change_room)
	self.add_child(scenes[current_room][current_period])

func change_scene(room: String, period: int) -> void:
	self.remove_child(scenes[current_room][current_period])
	current_room = room
	current_period = period
	self.add_child(scenes[current_room][current_period])

func _on_switch_period():
	change_scene(current_room, (current_period + 1) % 2)

func _on_change_room(room: String) -> void:
	change_scene(room, current_period)
	
