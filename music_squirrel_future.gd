extends AmbiantMusic

var music: AudioStream = preload("res://assets/audio/music/squirrel_present.mp3")

func _process(_delta: float) -> void:
	if Enigmas.tv_on and stream == null:
		stream = music
		play()
