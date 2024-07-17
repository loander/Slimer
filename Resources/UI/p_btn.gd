extends Control

@onready var player = %player

func _on_texture_button_pressed():
	Input.action_press("menu_pause")
	Input.action_release("menu_pause")

