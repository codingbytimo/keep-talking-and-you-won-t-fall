extends MultiplayerSynchronizer

var move_dir
var jump

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	move_dir = Input.get_axis("Left", "Right")
	jump = Input.is_action_just_pressed("Up")

func _physics_process(delta: float) -> void:
	move_dir = Input.get_axis("Left", "Right")
	jump = Input.is_action_just_pressed("Up")
