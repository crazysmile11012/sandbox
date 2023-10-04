extends Control

var point1
var point2
# Called when the node enters the scene tree for the first time.
func _ready():
	$MenuBar/settings/VBoxContainer/OptionButton.add_item("fast",0)
	$MenuBar/settings/VBoxContainer/OptionButton.add_item("fancy",1)
	$MenuBar/settings/VBoxContainer/OptionButton.add_item("fantastic",2)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$"../Node3D3".position.x = $tools/HSlider4.value
	$"../Node3D3".position.y = $tools/HSlider5.value
	$"../Node3D3".position.z = $tools/VSlider.value
	if $tools/point1.pressed:
		point1 = Vector3($tools/HSlider4.value,$tools/HSlider5.value,$tools/VSlider.value)
	if $tools/point2.pressed:
		point2 = Vector3($tools/HSlider4.value,$tools/HSlider5.value,$tools/VSlider.value)
func _on_sdfgi_toggled(button_pressed):
	Graphics.world_enviroment.environment.sdfgi_enabled = button_pressed
	
	



func _on_ssao_toggled(button_pressed):
	Graphics.world_enviroment.environment.ssao_enabled = button_pressed




func _on_glow_toggled(button_pressed):
	Graphics.world_enviroment.environment.glow_enabled = button_pressed






func _on_shadows_toggled(button_pressed):
	Graphics.light.shadow_enabled = button_pressed
	$"../OmniLight3D".shadow_enabled = button_pressed
	$"../OmniLight3D2".shadow_enabled = button_pressed
	$"../OmniLight3D3".shadow_enabled = button_pressed
	$"../OmniLight3D4".shadow_enabled = button_pressed
	$"../OmniLight3D5".shadow_enabled = button_pressed
	$"../OmniLight3D6".shadow_enabled = button_pressed



func _on_option_button_item_selected(index):
	Graphics.light.directional_shadow_mode = index  
	$"../OmniLight3D".omni_shadow_mode = index
	$"../OmniLight3D2".omni_shadow_mode = index
	$"../OmniLight3D3".omni_shadow_mode = index
	$"../OmniLight3D4".omni_shadow_mode = index
	$"../OmniLight3D5".omni_shadow_mode = index
	$"../OmniLight3D6".omni_shadow_mode = index
	
	

'''
func _on_v_slider_value_changed(value):
	#$"../Node3D2/Camera3D/SphericalDeformer".position.z = 0
	$"../Node3D2/Camera3D/SphericalDeformer".position.z = value-87
'''





func _on_transform_active_object_pressed():
	$"../DeformableMeshInstance3D".position.x = $tools/HSlider4.value
	$"../DeformableMeshInstance3D".position.y = $tools/HSlider5.value
	$"../DeformableMeshInstance3D".position.z = $tools/VSlider.value







func _on_rotate_active_object_pressed():
	$"../DeformableMeshInstance3D".rotate_x($tools/HSlider4.value)
	$"../DeformableMeshInstance3D".rotate_y($tools/HSlider5.value)
	$"../DeformableMeshInstance3D".rotate_z($tools/VSlider.value)







func _on_scale_active_object_pressed():
	$"../DeformableMeshInstance3D".scale.x = $tools/HSlider4.value
	$"../DeformableMeshInstance3D".scale.y = $tools/HSlider5.value
	$"../DeformableMeshInstance3D".scale.z = $tools/VSlider.value
