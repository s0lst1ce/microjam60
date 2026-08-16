extends AudioStreamPlayer

class_name AmbiantMusic

var pos = 0.0

func _enter_tree() -> void:
	play(pos)

func _exit_tree() -> void:
	pos = get_playback_position()
