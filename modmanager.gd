extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_file_dialog_file_selected(path):
	print(path)
	var success = ProjectSettings.load_resource_pack(path)
	if success:
		$Panel/VBoxContainer/list/FileDialog.show()
		print("mod loaded at path:")
		print(path)
		print_tree()
	else:
		$Panel/VBoxContainer/list/FileDialog.show()
		print("mod loading falure at:")
		print(path)
		







