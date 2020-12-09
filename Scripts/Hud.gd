extends Node2D
onready var vie = $vie
onready var count = $Ennemies


func _ready():
	pass # Replace with function body.

func _process(delta):
	vie.value = Global.vie
	count.set_text(String(Global.count))
