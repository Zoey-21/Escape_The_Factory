extends "res://enemies/ene_base.gd"

onready var timer = get_node("move_timer")# get move_timer node for use
var bullet = preload("res://enemies/Enemies_Shot.tscn")# loads bullet to fire

var rand_numb #random number for movement
var pos = Vector2() # holds angle of movement vector

func _ready():
	health = 2
	speed = 5

func _on_move_timer_timeout():# plays when move timer reaches zero
	rand_numb = randi() % 4 + 1 # makes random number from 1 to 4
	match rand_numb: # switch statment useing random numbers
		1:
			pos.x = 1 #right movment
		2:
			pos.x = -1 # left movment
		3:
			pos.y = 1 # down movment
		4:
			pos.y = -1 #up movment
