extends "res://enemies/ene_base.gd"

onready var level = get_node("..")
onready var effect = get_node("../boss")
onready var attack_timer = get_node("attack")
onready var tween = get_node("tween")
onready var shoot_timer = get_node("shoot_timer")
var anim = "idle"
var attack_time = false
var attack = false
var shooting = false
var wait
var dog_walker_scene

func _ready():
	health = 50# the health it has
	speed = 0#the speed it has

func _physics_process(delta):
	print(health)
	if attack == true:
		anim = "attack" 
	else:
		anim = "idle"
	sprite.play(anim)
	
	if health <= 49:
		if attack_time == false:
			attack_timer.start()
			attack_time = true
		print(attack_timer.get_time_left())
		
	if health <= 40:
		level.stop = false
		
	if health <= 35:
		effect.set_visible(true)
		$"/root/Global".boss_start = true
		
	if health <= 20:
		shoot_timer.set_wait_time(0.20) 
		
	if health <= 15:
		attack_timer.set_wait_time(1) 
		
	if health <= 0:
		get_tree().change_scene("res://Menus/ending.tscn")


	
func _on_attack_timeout():
	attack = true
	shooting = true
	
func _on_Sprite_animation_finished():
	attack = false
	shooting = false
	if attack == true:
		attack_time = false

