extends CharacterBody3D

const SPEED = 10.0

var sensitivity: float = 0.005

var max_vertical_angle: float = 90.0
var min_vertical_angle: float = -90.0

var yaw: float = 0.0
var pitch: float = 0.0

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event):
	if event is InputEventMouseMotion:
		yaw -= event.relative.x * sensitivity
		pitch -= event.relative.y * sensitivity
		
		pitch = clamp(pitch, deg_to_rad(min_vertical_angle), deg_to_rad(max_vertical_angle))
		rotation.x = pitch
		rotation.y = yaw

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
