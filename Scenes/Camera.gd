extends Camera2D

@onready var Boulder = %Boulder
@onready var WallL = %WallLeft
@onready var WallR = %WallRight
@onready var WallT = %top


@export var randomStrength: float = 3.0
@export var shakeFade: float = 5.0

var rng = RandomNumberGenerator.new()

var shake_strength: float = 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _on_boulder_body_entered(body):
	if body == WallL or body == WallR or body == WallT:
		apply_shake()

#func _on_boulder_collision(body):
	#if body == WallL or body == WallR or body == WallT:
		#apply_shake()

func apply_shake():
	shake_strength = randomStrength

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if shake_strength > 0:
		shake_strength = lerpf(shake_strength,0,shakeFade * delta)
		offset = randomOffset()

func randomOffset() -> Vector2:
	return Vector2(rng.randf_range(-shake_strength,shake_strength),rng.randf_range(-shake_strength,shake_strength))



