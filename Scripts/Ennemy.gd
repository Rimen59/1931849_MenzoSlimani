extends KinematicBody2D

export var vitesse = 250
var friction = 0.69
var acceleration = Vector2()
var velocite = Vector2()
export (PackedScene) var balle
onready var canon = $Cannon
onready var shootfx = $shoot
onready var timer = $Timer
var player
var is_in_range = false

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if is_in_range :
		var dir = player.get_position() - global_position
		rotation = dir.angle()
		velocite += Vector2(vitesse, 0).rotated(rotation) * delta
		velocite = move_and_slide(velocite)
		velocite = velocite.linear_interpolate(Vector2(0,0), friction * delta)


onready var screen_size = get_viewport_rect().size
var screen_buffer = 8;

	

func _on_Area2D_body_entered(body):
	if "Player" in body.name:
		timer.start()
		player = body
		is_in_range = true



func _on_Timer_timeout():
	var b = balle.instance()
	shootfx.play()
	b.creer(canon.global_position, rotation)
	get_parent().add_child(b)

