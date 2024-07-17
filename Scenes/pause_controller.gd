extends Node

var can_toggle_pause: bool = true

func _input(_delta):
	if Input.is_action_just_pressed("menu_pause"):
		if !get_tree().paused:
			pause()
		else:
			resume()

func pause():
	if can_toggle_pause:
		#get_tree().set_deferred("paused", true)
		Engine.time_scale = 1

func resume():
	if can_toggle_pause:
		#get_tree().set_deferred("paused", false)
		Engine.time_scale = 0.000001
