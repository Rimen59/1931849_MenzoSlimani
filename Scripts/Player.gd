extends KinematicBody2D

var vitesse = 600
var friction = 0.25
var acceleration = Vector2()
var velocite = Vector2()
var balle = preload("res://Scenes/Balle.tscn")
onready var canon = $Cannon
onready var shootfx = $shoot

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	get_input(delta)
	var dir = get_global_mouse_position() - global_position
	if dir.length() > 5:
		rotation = dir.angle()
		velocite = move_and_slide(velocite)
		velocite = velocite.linear_interpolate(Vector2(0,0), friction * delta)


onready var screen_size = get_viewport_rect().size
var screen_buffer = 8;

	
func get_input(delta):
	var avance = Input.is_action_pressed("Forward")
	var recule = Input.is_action_pressed("Backward")
	var strafeL = Input.is_action_pressed("Strafe_Left")
	var strafeR = Input.is_action_pressed("Strafe_Right")
	var shoot = Input.is_action_just_pressed("Shoot")

	
	if avance:
			acceleration = Vector2(vitesse, 0).rotated(rotation)
	elif recule:
			acceleration = Vector2(-vitesse, 0).rotated(rotation)
	elif strafeL:
			acceleration = Vector2(0, -vitesse).rotated(rotation)
	elif strafeR:
			acceleration = Vector2(0, vitesse).rotated(rotation)
	else:
		acceleration = Vector2(0,0)
		
	velocite += acceleration * delta
	if shoot:
		var b = balle.instance()
		shootfx.play()
		b.creer(canon.global_position, rotation)
		get_parent().add_child(b)
