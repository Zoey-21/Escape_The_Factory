extends KinematicBody2D

onready var sprite = get_node("Sprite")

func _physics_process(_delta):
	
	if $"/root/Global".player.get_position() < self.position: #if player is on the left 
		sprite.set_flip_h(true)# flip horazontal
	else:
		sprite.set_flip_h(false)# dont flip
	
	
