extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -400.0

var move_dir := 0.0

func _physics_process(delta: float) -> void:
	# Movement for left and right
	move_dir = Input.get_axis("Left", "Right")
	velocity.x = move_dir * SPEED
	
	# Movement for jumps
	if Input.is_action_just_pressed("Up") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	if !is_on_floor():
		velocity += get_gravity() * delta * 1.5
	
	move_and_slide()
