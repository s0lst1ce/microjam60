extends Node

enum ColorState {RED, GREEN, ORANGE, PURPLE}

var metal_buttons = [ColorState.RED, ColorState.RED, ColorState.RED]
var metal_tree_reward_taken = false
var tv_buttons = [ColorState.RED, ColorState.RED, ColorState.RED, ColorState.RED]

func next_color(color: ColorState) -> ColorState:
	return (color+1)%4

func is_metal_tree_valid() -> bool:
	if metal_buttons[0] == ColorState.ORANGE and metal_buttons[1] == ColorState.PURPLE and metal_buttons[2] == ColorState.PURPLE:
		return true
	else:
		return false

func is_tv_valid() -> bool:
	if tv_buttons[0] == ColorState.ORANGE and tv_buttons[1] == ColorState.GREEN and tv_buttons[2] == ColorState.RED and tv_buttons[3] == ColorState.PURPLE:
		return true
	else:
		return false
	


func _process(delta: float) -> void:
	if is_metal_tree_valid():
		ItemExchange.add_item.emit("wrench")
		ItemExchange.add_item.emit("wrench")


var tv_on = false
var bedroom_flushed = false
var plant_dead = false
