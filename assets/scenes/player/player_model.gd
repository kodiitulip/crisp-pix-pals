extends Node3D

@onready var arms: MeshGroup = $Armature/Skeleton3D/Arms
@onready var chest: MeshGroup = $Armature/Skeleton3D/Chest
@onready var feet: MeshGroup = $Armature/Skeleton3D/Feet
@onready var head: MeshGroup = $Armature/Skeleton3D/Head
@onready var hand: MeshGroup = $Armature/Skeleton3D/Hand
@onready var legs: MeshGroup = $Armature/Skeleton3D/Legs
@onready var animation_tree: AnimationTree = $AnimationTree
@onready var animation_playback: AnimationNodeStateMachinePlayback = animation_tree["parameters/playback"]

var input_speed: float


func _physics_process(_delta):
	_update_animation_blend()
	

func _update_animation_blend():
	if input_speed:
		animation_playback.travel("Humanoid_human_walk")
	else:
		animation_playback.travel("Humanoid_human_idle")
	
