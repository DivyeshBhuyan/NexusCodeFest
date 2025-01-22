extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -550.0
@onready var sprite_2d = $Sprite2D 

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var jump_count = 0  # Counter for jumps

func jump():
	velocity.y = JUMP_VELOCITY
	jump_count += 1  # Increase jump count on every jump

func jump_side(x):
	velocity.y = JUMP_VELOCITY
	velocity.x = x
	jump_count += 1  # Increase jump count on every jump

func _physics_process(_delta):
	# Check if the player is in the air or on the ground
	if not is_on_floor():
		velocity.y += gravity * _delta
		if sprite_2d.animation != "jump":
			sprite_2d.animation = "jump"
	elif abs(velocity.x) > 1:
		if sprite_2d.animation != "run":
			sprite_2d.animation = "run"
	else:
		if sprite_2d.animation != "idle":
			sprite_2d.animation = "idle"
	
	# Handle jump input
	if Input.is_action_just_pressed("ui_accept"):
		if is_on_floor():
			velocity.y = JUMP_VELOCITY
			jump_count = 1  # Reset jump count when landing
		elif jump_count == 1:  # Double jump if already in the air
			velocity.y = JUMP_VELOCITY
			
			jump_count = 2  # Lock to double jump state

	# Handle horizontal movement and deceleration
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction != 0:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, 12)

	# Move the character and flip the sprite based on direction
	move_and_slide()
	
	if velocity.x < 0:
		sprite_2d.flip_h = true
	elif velocity.x > 0:
		sprite_2d.flip_h = false

# This will make sure the player is added to the "player" group so the flag can detect them
func _ready():
	add_to_group("player")
