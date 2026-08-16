extends CharacterBody2D

@export var movement_speed: float = 250
var movement_target_position: Vector2
var target_furniture: Furniture

@onready var navigation_agent: NavigationAgent2D = $NavigationAgent2D
@onready var animation = $AnimationPlayer
@onready var sprite = $Sprite2D
@onready var interacting_item_data = null
@onready var sfx = $SoundEffects

func _ready():
	# These values need to be adjusted for the actor's speed
	# and the navigation layout.
	navigation_agent.path_desired_distance = 4.0
	navigation_agent.target_desired_distance = 4.0

	movement_target_position = position
	# Make sure to not await during _ready.
	actor_setup.call_deferred()
	animation.play("walk")

	ItemExchange.walk_to.connect(_on_interact_furniture)
	ItemExchange.prepare_use_item.connect(_on_use_item)
	Conductor.play_sfx.connect(_on_play_sfx)

func actor_setup():
	# Wait for the first physics frame so the NavigationServer can sync.
	await get_tree().physics_frame

	# Now that the navigation map is no longer empty, set the movement target.
	set_movement_target(movement_target_position)

func set_movement_target(movement_target: Vector2):
	print("pathing player to ", movement_target)
	animation.play("walk")
	movement_target_position = movement_target
	navigation_agent.target_position = movement_target

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("click"):
		var mouse = get_global_mouse_position()
		set_movement_target(mouse)

func _physics_process(_delta):
	if navigation_agent.is_navigation_finished():
		return

	var current_agent_position: Vector2 = global_position
	var next_path_position: Vector2 = navigation_agent.get_next_path_position()
	var new_velocity : Vector2 = (next_path_position - current_agent_position).normalized()

	if navigation_agent.avoidance_enabled:
		navigation_agent.set_velocity(new_velocity)
	else:
		_on_navigation_agent_2d_velocity_computed(new_velocity)

func _on_navigation_agent_2d_navigation_finished() -> void:
	print("currently at: ", global_position)
	if target_furniture != null:
		if !Geometry2D.is_point_in_polygon(global_position-target_furniture.walk_to.global_position, target_furniture.walk_to.polygon):
			print("actually didn't go for ", target_furniture)
			target_furniture = null
			interacting_item_data = null

		elif interacting_item_data != null:
			sfx.stream = interacting_item_data.item.use_sound
			sfx.play()
			target_furniture._interact_with(interacting_item_data.item)
			interacting_item_data.item = null
			interacting_item_data.update_ui()
			interacting_item_data = null

		else:
			print("empty-handed interaction with ", target_furniture)
			target_furniture.empty_handed_interaction()

	animation.play("idle")

func _on_navigation_agent_2d_velocity_computed(safe_velocity: Vector2) -> void:
	if safe_velocity.x < 0:
		sprite.flip_h = true
	elif safe_velocity.x > 0:
		sprite.flip_h = false
	velocity = safe_velocity * movement_speed
	move_and_slide()

func _on_interact_furniture(pos: Vector2, furniture: Furniture):
	set_movement_target(pos)
	target_furniture = furniture

func _on_use_item(data: Variant):
	print("on our way to use ", data.item)
	interacting_item_data = data

func _on_play_sfx(stream: AudioStream):
	sfx.stream = stream
	sfx.play()
