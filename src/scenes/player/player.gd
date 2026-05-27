extends CharacterBody2D

const SPEED = 200.0
const JUMP_VELOCITY = -400.0

var move_dir := 0.0
var last_dir := 0.0
@onready var animation_tree: AnimationTree = $Animation/AnimationTree

func _ready() -> void:
	$InputSynchronizer.set_multiplayer_authority(multiplayer.get_unique_id())
	if multiplayer.is_server():
		hide()

func _physics_process(delta: float) -> void:
	# Movement for left and right
	move_dir = $InputSynchronizer.move_dir
	velocity.x = move_dir * SPEED
	
	# Movement for jumps
	if $InputSynchronizer.jump and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	if !is_on_floor():
		velocity += get_gravity() * delta * 1.5
		
	animate()
	move_and_slide()
	
func animate() -> void:
	if multiplayer.is_server():
		hide()
	else:
		show()
	if move_dir != 0:
		last_dir = move_dir
	var animation_dir = Vector2(round(last_dir), 0)
	animation_tree.set("parameters/MovementStateMachine/Idle/blend_position", animation_dir)
