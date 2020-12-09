extends Node2D

export var niveau ="res://scenes/Level1.tscn"
onready var button = $Button
onready var boom = $Boom


func _ready():
	boom.play()

func _on_Button_pressed():
	Global.goto_scene(niveau)
	Global.vie = 100
