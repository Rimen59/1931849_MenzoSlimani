extends Node

var nbEnnemies
var ennemies
var ennemies_are_spawned = false
export var niveau ="res://scenes/Level1.tscn"

func _ready():
	pass # Replace with function body.

func _process(delta):
	ennemies = get_tree().get_nodes_in_group("ennemy")
	nbEnnemies = ennemies.size()
	print(ennemies.size())
	if nbEnnemies > 0 :
		ennemies_are_spawned = true;
	if nbEnnemies == 0 and ennemies_are_spawned :
		Global.goto_scene(niveau)
	if Global.vie <= 0 :
		Global.goto_scene("res://scenes/Loser.tscn")
	Global.count = ennemies.size()
