extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -200.0

@onready var animation: AnimatedSprite2D = $AnimatedSprite2D

var respawn_position: Vector2
func _ready():
	respawn_position = global_position
	
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if is_on_floor():
		if direction > 0:
			animation.play("walking")
			animation.flip_h = false
		elif direction < 0:
			animation.play("walking")
			animation.flip_h = true
		else:
			animation.play("idle")
	else:
		animation.play("jumping")
		if direction > 0:
			animation.flip_h = false
		elif direction < 0:
			animation.flip_h = true
	
	if global_position.y > 180:
		global_position = respawn_position
		velocity = Vector2.ZERO

	move_and_slide()
