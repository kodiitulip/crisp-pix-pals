extends Node
class_name MovementComponent

@export var gravity: float = 9.8
@export_range(0.,1.,.01) var accel: float = .25
@export_range(0.,1.,.01) var friction: float = .5
@export var speed: float = 5.
@export var jump_vel: float = 3.
@export var direction: Vector3 = Vector3.ZERO
@export var character: CharacterBody3D
var velocity: Vector3


func _physics_process(delta):
	_jump(delta)
	_acceleration(direction)
	character.velocity = velocity
	character.move_and_slide()
	

func _jump(delta):
	if not character.is_on_floor():
		velocity.y -= gravity * delta
	if Input.is_action_just_pressed("jump") and character.is_on_floor():
		velocity.y = jump_vel


func _acceleration(dir: Vector3):
	if dir != Vector3.ZERO:
		velocity.x = lerp(velocity.x, dir.x * speed, accel)
		velocity.z = lerp(velocity.z, dir.z * speed, accel)
	else:
		velocity.x = lerp(velocity.x, 0.0, friction)
		velocity.z = lerp(velocity.z, 0.0, friction)
