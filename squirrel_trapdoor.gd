extends TextureButton

func _on_pressed() -> void:
	SceneSwitching.goto_room.emit("magpie")
