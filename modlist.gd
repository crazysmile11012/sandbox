extends Panel


# Called when the node enters the scene tree for the first time.
func _ready():
	print_tree()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_reload_pressed():
	pass # Replace with function body.


func _on_file_dialog_files_selected(paths):
	var paths2 = paths [0] 
	print(paths2)


func _on_button_pressed():
	pass # Replace with function body.
