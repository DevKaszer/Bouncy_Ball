extends Area2D


func _on_body_entered(body):
	get_tree().change_scene_to_file("res://Scenes/game.tscn")
	Global.score = 0
