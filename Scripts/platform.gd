extends Node2D

var isTouched : bool = false

func _process(delta):
	position.y += 30 * delta


func _on_checker_body_entered(body):
	if isTouched == false:
		Global.addScore()
	isTouched = true
