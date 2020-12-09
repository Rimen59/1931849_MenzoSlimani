extends KinematicBody2D

export var dmg = 5
var vitesse = 800
var velocite = Vector2()

func creer(pos,dir):
	
	rotation_degrees = (rad2deg(dir))
	position = pos
	velocite = Vector2(vitesse,0).rotated(dir)


func _physics_process(delta):
	var collision = move_and_collide(velocite*delta)
	if collision:
		print("I collided with ", collision.collider.name)
		if !("Player" in collision.collider.name):
			print(collision.collider.name + " hit")
			collision.collider.queue_free()
		else :
			Global.UpdateLife(dmg);
		queue_free()

func _on_VisibilityNotifier2D_viewport_exited(viewport):
	queue_free()
