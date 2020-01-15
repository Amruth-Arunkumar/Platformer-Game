extends Node

func _ready():
	$MarginContainer/VBoxContainer/HBoxContainer/TextureButton.grab_focus()
	
func _physics_process(delta):
	if $MarginContainer/VBoxContainer/HBoxContainer/TextureButton.is_hovered() == true:
		$MarginContainer/VBoxContainer/HBoxContainer/TextureButton.grab_focus()
	if $MarginContainer/VBoxContainer/HBoxContainer/TextureButton2.is_hovered() == true:
		$MarginContainer/VBoxContainer/HBoxContainer/TextureButton2.grab_focus()
	if $MarginContainer/VBoxContainer/HBoxContainer/TextureButton3.is_hovered() == true:
		$MarginContainer/VBoxContainer/HBoxContainer/TextureButton3.grab_focus()
	if $MarginContainer/VBoxContainer/HBoxContainer/TextureButton4.is_hovered() == true:
		$MarginContainer/VBoxContainer/HBoxContainer/TextureButton4.grab_focus()
	

func _on_TextureButton_pressed():
	get_tree().change_scene("StageOne.tscn")

func _on_TextureButton2_pressed():
	get_tree().change_scene("StageTwo.tscn")

func _on_TextureButton3_pressed():
	get_tree().change_scene("StageThree.tscn")

func _on_TextureButton4_pressed():
	get_tree().change_scene("StageFour.tscn")

func _on_TextureButton5_pressed():
	get_tree().change_scene("HowToPlay.tscn")
