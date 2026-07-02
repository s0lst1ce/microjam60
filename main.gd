extends Node2D

@onready var current_room: String = "magpie"
@onready var current_period: int = 1
@onready var gui = $GUI
@onready var period_button = $GUI/PeriodButton
@onready var player = $Player
@onready var intro = $IntroVideo
#@onready var outro =  $OutroVideo

@onready var scenes = {
	"magpie": [preload("res://magpie_lounge_retro.tscn").instantiate(), preload("res://magpie_lounge_future.tscn").instantiate()],
	"squirrel": [preload("res://squirrel_bedroom_retro.tscn").instantiate(), preload("res://squirrel_bedroom_future.tscn").instantiate()]
}

func _ready() -> void:
	intro.play()
	_on_intro_video_finished()

func _on_intro_video_finished() -> void:
	intro.queue_free()
	gui.show()
	player.show()
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
	var pos = scenes[current_room][current_period].spawn_point.position
	player.position = pos
	player.movement_target_position = player.position
	player.set_movement_target(player.position)

func _process(_delta: float) -> void:
	if Enigmas.has_won:
		self.add_sibling(load("res://outro.tscn").instantiate())
		self.queue_free()
