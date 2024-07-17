extends Node2D

@onready var playerr = %player


# Called when the node enters the scene tree for the first time.
func _ready():
	playerr.impulseSide = 0
	playerr.impulseUp = 0
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

