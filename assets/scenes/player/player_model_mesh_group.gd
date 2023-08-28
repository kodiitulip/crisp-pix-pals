extends Node3D
class_name MeshGroup

var current_part: MeshInstance3D
var meshes = get_children()

func _ready():
	_only_one_visible_part()


func _process(_delta):
	pass

func _only_one_visible_part():
	if meshes.size() == 0: return
	for i in meshes:
		meshes[i].visible = false
	meshes[0].visible = true
	
