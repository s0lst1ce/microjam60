extends Interactible

@onready var blue = $ShirtButtonBlue
@onready var orange = $ShirtButtonOrange
@onready var purple = $ShirtButtonPurple
@onready var blue_light = $Blue
@onready var orange_light = $Orange
@onready var purple_light = $Purple

@onready var filled = [false, false, false]

func _interact_with(item: ItemData) -> void:
	if item.name == "shirt_button_blue":
		filled[0]=true
		blue.show()
		blue_light.show()
	elif item.name == "shirt_button_orange":
		filled[1]=true
		orange.show()
		orange_light.show()
	elif item.name == "shirt_button_purple":
		filled[2]=true
		purple.show()
		purple_light.show()

	if filled == [true, true, true]:
		Enigmas.has_won = true
