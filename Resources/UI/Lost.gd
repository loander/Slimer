extends Control

var score = 0;
@onready var scoreText = %LostScore

func addPoints(scoreDelta):
	score += scoreDelta;
	scoreText.text = str(score);
	pass;


func getScore():
	return score;


func _on_restart_2_pressed():
	get_tree().reload_current_scene()
	Engine.time_scale = 1


func _on_quit_2_pressed():
	get_tree().quit()
