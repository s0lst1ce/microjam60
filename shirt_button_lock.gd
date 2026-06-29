extends Furniture

@onready var blue = $ShirtButtonBlue
@onready var orange = $ShirtButtonOrange
@onready var purple = $ShirtButtonPurple

@onready var filled = [false, false, false]

func _interact_with(item: ItemData) -> void:
	if item.name == "shirt_button_blue":
		filled[0]=true
		blue.show()
	elif item.name == "shirt_button_orange":
		filled[1]=true
		orange.show()
	elif item.name == "shirt_button_purple":
		filled[2]=true
		purple.show()

	if filled == [true, true, true]:
		Enigmas.has_won = true
