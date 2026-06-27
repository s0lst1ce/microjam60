extends CharacterBody2D

var movement_speed: float = 250.0
var movement_target_position: Vector2 = Vector2(250.0,25.0)
var furniture_target_position: Vector2
var target_furniture

@onready var navigation_agent: NavigationAgent2D = $NavigationAgent2D

func _ready():
	# These values need to be adjusted for the actor's speed
	# and the navigation layout.
	navigation_agent.path_desired_distance = 4.0
	navigation_agent.target_desired_distance = 4.0

	# Make sure to not await during _ready.
	actor_setup.call_deferred()
	
	ItemExchange.can_give.connect(_on_can_give)

func actor_setup():
	# Wait for the first physics frame so the NavigationServer can sync.
	await get_tree().physics_frame

	# Now that the navigation map is no longer empty, set the movement target.
	set_movement_target(movement_target_position)

func set_movement_target(movement_target: Vector2):
	navigation_agent.target_position = movement_target

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("click"):
		var mouse = get_global_mouse_position()
		navigation_agent.target_position = mouse
		movement_target_position = mouse

func _physics_process(delta):
	if navigation_agent.is_navigation_finished():
		return

	var current_agent_position: Vector2 = global_position
	var next_path_position: Vector2 = navigation_agent.get_next_path_position()

	velocity = current_agent_position.direction_to(next_path_position) * movement_speed
	move_and_slide()


func _on_can_give(furniture):
	print("going for ", furniture)
	target_furniture = furniture
	print(get_global_mouse_position(), movement_target_position)
	furniture_target_position = get_global_mouse_position()

func _on_navigation_agent_2d_navigation_finished() -> void:
	print("finished nav")
	if furniture_target_position != movement_target_position:
		print("actually didn't go for ", target_furniture)
		target_furniture = null
		return

	if target_furniture != null and len(target_furniture.gives) > 0:
		print("taking item")
		ItemExchange.add_item.emit(target_furniture.gives.pop_front())
