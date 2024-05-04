extends Node

const PLATFORM = preload("res://Scenes/platform.tscn")
@onready var timer = $Timer
var previous

func _ready():
	var obj = PLATFORM.instantiate()
	previous = obj
	add_child(obj)
	obj.position.y = 10
	timer.start()

func _on_timer_timeout():
	var num = RandomNumberGenerator.new()
	var newNum = num.randi_range(-80,80)
	get_tree().queue_delete(previous)
	var obj = PLATFORM.instantiate()
	previous = obj
	add_child(obj)
	obj.position.x = newNum
	obj.position.y -= 12
