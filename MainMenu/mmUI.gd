extends Control


@onready var playerr = %player


var default = Color(1, 1, 1, 1)
var red = Color(1, 0, 0, 1)
var blue = Color(0, 0, 1, 1)
var green = Color(0, 1, 0, 1)
var gold = Color(1, 0.843, 0, 1)
var bronze = Color(0.804, 0.498, 0.196, 1)
var silver = Color(0.753, 0.753, 0.753, 1)
var obsidian = Color(0.102, 0.125, 0.173, 1)
var purple = Color(0.502, 0, 0.502, 1)
var pink = Color(1, 0.412, 0.706, 1)
var aqua = Color(0, 1, 1, 1)
var rust = Color(0.717, 0.341, 0.094, 1)
var grey = Color(0.502, 0.502, 0.502, 1)


func _on_play_pressed():
	get_tree().change_scene_to_file("res://Scenes/test.tscn")


func _on_green_pressed():
	playerr.modulate = green



func _on_purple_pressed():
	playerr.modulate = purple




func _on_rust_pressed():
	pass # Replace with function body.

