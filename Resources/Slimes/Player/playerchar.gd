extends RigidBody2D

@onready var anim = $animpl
@onready var spritec = $CollisionPolygon2D
@onready var timer = $Timer
@onready var sprite = $Sprite2D

var screensize : Vector2


#var colorsprite = sprite.modulate

var velocity = Vector2()

var impulseSide = 8000
var impulseUp = -4000


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



func _ready() -> void:
	screensize = get_viewport_rect().size
	if velocity == Vector2():
		anim.play("idle")
func _process(delta: float) -> void:
	# Change the color of the player sprite
	modulate = gold
	rotation = 0.0
	pass

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("click") and get_global_mouse_position().y > (screensize.y/2):
		if get_global_mouse_position().x > ( (screensize.x)/2 ):
			fire_event(true) #right side
		else:
			fire_event(false) #left side


func fire_event(b:bool) -> void:
	if b: #right
		apply_central_impulse(Vector2(impulseSide,impulseUp))
		if timer.is_stopped():
			impulseUp = -4000
		else:
			impulseUp = 0
		anim.play("jump")
		timer.start()
	else: #left
		apply_central_impulse(Vector2(-impulseSide,impulseUp))
		if timer.is_stopped():
			impulseUp = -4000
		else:
			impulseUp = 0
		anim.play("jump")
		timer.start()
	pass



func _on_timer_timeout():
	anim.play("idle")
	print("idle")
