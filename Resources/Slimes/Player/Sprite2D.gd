extends Sprite2D

var screensize : Vector2


func _ready() -> void:
	screensize = get_viewport_rect().size

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("click"):
		if get_global_mouse_position().x > ( (screensize.x)/2 ):
			fire_event(true) #right side
		else:
			fire_event(false) #left side


func fire_event(b:bool) -> void:
	if b: #right
		flip_h = true
	else: #left
		flip_h = false
	pass
