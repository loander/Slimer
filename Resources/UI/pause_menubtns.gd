extends Control



func _on_resume_pressed():
	Input.action_press("menu_pause")
	Input.action_release("menu_pause")


func _on_quit_pressed():
	get_tree().quit()


func _on_restart_pressed():
	get_tree().reload_current_scene()
	Engine.time_scale = 1
