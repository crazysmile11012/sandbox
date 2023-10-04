#@tool
extends MeshInstance3D
@export var update = false
@export var subdev = 0
@export var clearvert = false
@export var object = Mesh
var z = 5
func _ready():
	generate()
	
func _input(event):
	if Input.is_action_pressed("click"):
		var position2D = get_viewport().get_mouse_position()
		var Plane = PlaneMesh.new()
		var dropPlane  = Plane(Vector3(0, 0, 10), z)
		var position3D = dropPlane.intersects_ray($"../Node3D2/Camera3D".project_ray_origin(position2D),$"../Node3D2/Camera3D".project_ray_normal(position2D))
		print(position3D)

		
	
func _process(delta):
	

	#if update:
	for i in get_children():
		i.free()
	generate()
		#update = false
		
		
	if clearvert:
		clearvert = false
		for i in get_children():
			i.free()
		
		
func generate():
	
	
	var a_mesh:ArrayMesh
	var surftool = SurfaceTool.new()
	surftool.begin(Mesh.PRIMITIVE_TRIANGLES)
	
	for z in range(subdev+1):
		for x in range(subdev+1):
			for y in range(subdev+1):
				#surftool.add_vertex(Vector3(x,y,z))
				if z == subdev or z == 0:
					draw_sphere(Vector3(x,y,z),object,subdev)
				if x == subdev or x == 0:
					draw_sphere(Vector3(x,y,z),object,subdev)	
				if y == subdev or y == 0:
					draw_sphere(Vector3(x,y,z),object,subdev)	
					
	'''
	var vert = 0
	for z in range(subdev+1):
		for x in range(subdev+1):
			for y in range(subdev+1):
				surftool.add_index(vert+0)
				surftool.add_index(vert+1)
				surftool.add_index(vert+subdev+1)
				surftool.add_index(vert+subdev+1)
				surftool.add_index(vert+1)
				surftool.add_index(vert+subdev+2)
				vert+=1
		vert+=1
	'''
	a_mesh = surftool.commit()
	mesh = a_mesh
	

func draw_sphere(pos:Vector3,object,subdev):
	var ins = MeshInstance3D.new()
	ins.set_script("res://modelins.gd")
	add_child(ins)
	ins.position = pos
	
	var sphere = object
	#sphere.radius = 1
	#sphere.height = 0.5
	ins.mesh = sphere
	ins.scale_object_local(Vector3(0.5,0.5,0.5))
	ins.set_script("res://modelins.gd")
	insscript(ins)
func insscript(ins):
	
	if ins.position.y >= subdev:
		ins.position.y = subdev+1
	
