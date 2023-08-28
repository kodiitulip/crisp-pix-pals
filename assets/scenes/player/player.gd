extends CharacterBody3D

@onready var camera_mount = $CameraMount
@onready var model = $CharacterModel
@onready var movement_component = $MovementComponent


func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED


func _input(_event):
	if Input.is_action_just_pressed("escape"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE


func _physics_process(_delta):
	var input_direction = _get_input_direction()
	movement_component.direction = input_direction
	if input_direction: _fix_model_rotation()
	model.input_speed = velocity.length() / movement_component.speed


func _get_input_direction() -> Vector3:
	var input_dir = Input.get_vector("strafe_left", "strafe_right", "move_foward", "move_backwards")
	var dir = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	dir = dir.rotated(Vector3.UP, camera_mount.rotation.y)
	return dir


func _fix_model_rotation():
	model.rotation.y = lerp_angle(model.rotation.y, atan2(-velocity.x, -velocity.z), movement_component.accel)
	
