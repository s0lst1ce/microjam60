extends Furniture

@onready var blue = $ShirtButtonBlue
@onready var orange = $ShirtButtonOrange
@onready var purple = $ShirtButtonPurple

func _interact_with(item: ItemData) -> void:
	if item.name == "shirt_button_blue":
		blue.show()
	elif item.name == "shirt_button_orange":
		orange.show()
	elif item.name == "shirt_button_purple":
		purple.show()
