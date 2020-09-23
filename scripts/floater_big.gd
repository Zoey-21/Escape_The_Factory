extends "res://enemies/ene_base.gd"

var floater = preload("res://enemies/floater.tscn")

func _ready():
	health = 5# makes health 5
	speed = 100#speed it can move at

func kill():
	var floater_instance = floater.instance()# makes instance of floadter
	floater_instance.position = get_global_position() # makes the instance at big floaters position
	get_tree().get_root().add_child(floater_instance)# adds instance to sceane
	queue_free()# removes big floater from sceane
	$"/root/Global".enedistroy.play()#playes death sound
