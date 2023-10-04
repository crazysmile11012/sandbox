extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	#self.position = Vector3($"../Node3D".subdev/2,$"../Node3D".subdev/2,$"../Node3D".subdev/2)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed and event.is_action("camrollup"):
			self.rotate_x(+0.1)
		if event.pressed and event.is_action("camrolldown"):
			self.rotate_x(-0.1)
		if event.pressed and event.is_action("camrollleft"):
			self.rotate_y(+0.1)
		if event.pressed and event.is_action("camrollright"):
			self.rotate_y(-0.1)




var meshbackup

func _on_add_deform_pressed():
	'''
	var script = $Camera3D/SphericalDeformer.get_script()
	var sphere = $"../Node3D2/Camera3D/SphericalDeformer"
	var newsphere = sphere.duplicate()
	newsphere.set_script(script)
	newsphere.get_property_list().clear()
	newsphere.get_property_list().append(sphere.get_property_list())
	print_tree()
	#newsphere.reparent($"../WorldEnvironment")
	'''
	meshbackup = $"../DeformableMeshInstance3D".original_mesh
	$"../DeformableMeshInstance3D".original_mesh = $"../DeformableMeshInstance3D".mesh
	


func _on_undo_pressed():
	if meshbackup == null:
		pass
	else:
		$"../DeformableMeshInstance3D".original_mesh = meshbackup
