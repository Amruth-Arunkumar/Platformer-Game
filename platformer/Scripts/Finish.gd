extends Area2D

func _ready():
	pass 

func _on_Finish_body_entered(body):
	if "Player" in body.name:
		get_tree().change_scene("TitleScreen.tscn")