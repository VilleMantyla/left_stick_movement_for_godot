extends KinematicBody

var move_input = Vector3.ZERO
var move_input_deadzone = 0.1

var move_deadzone = 0.32
var move_dir = Vector3.ZERO

var speed = 3.0

# Called when the node enters the scene tree for the first time.
func _ready():
	InputMap.action_set_deadzone("left_stick_left", move_input_deadzone)
	InputMap.action_set_deadzone("left_stick_right", move_input_deadzone)
	InputMap.action_set_deadzone("left_stick_down", move_input_deadzone)
	InputMap.action_set_deadzone("left_stick_up", move_input_deadzone)

func _process(delta):
	move_input.x = Input.get_action_strength("left_stick_right") - Input.get_action_strength("left_stick_left")
	move_input.z = Input.get_action_strength("left_stick_down") - Input.get_action_strength("left_stick_up")
	
	if Vector3.ZERO.distance_to(move_input) > move_deadzone*sqrt(2.0):
		move_dir = move_input.normalized()
	else:
		move_dir = Vector3.ZERO

func _physics_process(delta):
	move_and_slide(move_input*speed)
