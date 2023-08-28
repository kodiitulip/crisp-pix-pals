extends Node3D
class_name CameraControls

@export var mouse_sens = .5
@onready var spring_arm = $SpringArm


func _input(event):
	if event is InputEventMouseMotion:
		rotate_y(deg_to_rad(-event.relative.x * mouse_sens))
		spring_arm.rotate_x(deg_to_rad(-event.relative.y * mouse_sens))
		spring_arm.rotation.x = clamp(spring_arm.rotation.x, -PI/4, PI/4)
