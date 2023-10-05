'''
@tool
extends MeshInstance3D
@export var update = false
@export var subdev = 1

func _ready():
	gen_mesh()
func gen_mesh():
	var a_mesh = ArrayMesh.new()
	var vertices := PackedVector3Array([
		Vector3(0,1,0),
		Vector3(1,1,0),
		Vector3(1,1,1),
		Vector3(0,1,1),
		
		Vector3(0,0,0),
		Vector3(1,0,0),
		Vector3(1,0,1),
		Vector3(0,0,1)
		
		
	])
	var indices := PackedInt32Array([
		0,1,2,
		0,2,3,
		3,2,7,
		2,6,7,
		2,1,6,
		1,5,6,
		
		1,4,5,
		1,0,4,
		0,3,7,
		4,0,7,
		6,5,4,
		4,7,6
	])
	var uvs = PackedVector2Array([
		Vector2(0,0),
		Vector2(1,0),
		Vector2(1,1),
		Vector2(0,1),
		
		Vector2(0,0),
		Vector2(1,0),
		Vector2(1,1),
		Vector2(0,1)
	])
	#var array = []
	#array.resize(Mesh.ARRAY_MAX)
	#array[Mesh.ARRAY_VERTEX] = vertices
	#array[Mesh.ARRAY_INDEX] = indices
	#array[Mesh.ARRAY_TEX_UV] = uvs
	#a_mesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, array)
	mesh = a_mesh
	var surftool = SurfaceTool.new()
	#surftool.begin(Mesh.PRIMITIVE_TRIANGLES)
	#for i in range(vertices.size()):
		#surftool.set_uv(uvs[i])
		#surftool.add_vertex(vertices[i])
	#for i in indices:
	#	surftool.add_index(i)
	#surftool.generate_normals()
	#a_mesh = surftool.commit()
	#mesh = a_mesh
	
func _process(delta):
	if update:
		gen_mesh()
		update = false
		
'''	
