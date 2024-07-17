extends Sprite2D


@onready var animplayer = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	animplayer.play("float")# Replace with function body.
