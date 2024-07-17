extends Node2D


@onready var pause_menu = $PauseMenu
@onready var pcon = %PauseController
@onready var Lost = $Lost

@onready var playerr = $player
@onready var theBall = $Boulder
@onready var Floor = $Floor
@onready var WallL = $WallLeft
@onready var WallR = $WallRight
@onready var WallT = $top
@onready var scoree = $ScoreUI

@onready var sTimer = $StartTimer

@onready var vsTimer = $vsTimer
@onready var vTimer = $timerVis
var countdown = 3

var paused = false

#Screen shake start
@onready var cam = $Camera
#Screen shake end



func _ready():
	# Set random x coordinate between 82 - 991
	theBall.position = Vector2(randf_range(82, 991), 472)
	freeze()

func _process(delta):
	if Input.is_action_just_pressed("menu_pause"):
		pauseMenu()
	vTimer.text = str(countdown)
	if countdown <= 0:
		vTimer.hide()
	#screenshake

func freeze():
	theBall.freeze = true
	playerr.freeze = true
	pass
func unfreeze():
	theBall.freeze = false
	playerr.freeze = false
	pass

func pauseMenu():
	if paused:
		pause_menu.hide()
		playerr.impulseSide = 8000
		playerr.impulseUp = -4000
		Engine.time_scale = 1
	else:
		pause_menu.show()
		playerr.impulseSide = 0
		playerr.impulseUp = 0
		Engine.time_scale = 0.000001
	paused = !paused


func _on_boulder_body_entered(body):
	if body == Floor:
		print("FLOOR HIT")
		Lost.show()
		playerr.impulseSide = 0
		playerr.impulseUp = 0
		Engine.time_scale = 0.000001
	elif body == WallR:
		scoree.addPoints(1);
		Lost.addPoints(1);
		#cam.start_shake(0.5, 0.5);
	elif body == WallL:
		scoree.addPoints(1);
		Lost.addPoints(1);
		#cam.start_shake(0.5, 0.5);
	elif body == WallT:
		scoree.addPoints(100);
		Lost.addPoints(100);
	elif body == playerr:
		scoree.addPoints(10);
		Lost.addPoints(10);




func _on_start_timer_timeout():
	print("timer stopped")
	unfreeze()
	


func _on_vs_timer_timeout():
	countdown -= 1
