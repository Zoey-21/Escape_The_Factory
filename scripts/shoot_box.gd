extends Area2D

var bullet = preload("res://enemies/Enemies_Shot.tscn")# loads bullet to fire



export var bullet_speed = 500 # speed for the bullet to move at
var shot_aim = Vector2(15, -3)# offset where it fires from

func _physics_process(delta):
	look_at($"/root/Global".player.get_position())

func _on_shoot_timer_timeout():# it will fire
	if $"/root/Global".level_ended == false:
		var bullet_instance = bullet.instance()# set up a instance of the bullet
		bullet_instance.position = get_global_position() + shot_aim #gives bullet player position
		bullet_instance.apply_central_impulse( Vector2(bullet_speed, 0).rotated(rotation)) #aplies force in direction
		get_tree().get_root().add_child(bullet_instance)# adds bullet to the root of the map
		$"/root/Global".eneshoot.play()
	
#func _physics_process(_delta):
	
#	if $"/root/Global".player.get_position() < get_global_position(): #if player is on the left 
#		set_rotation_degrees(180)# flip aim
#		shot_aim = Vector2(-15, -3)# moves offset where it fires from
#	else:
#		set_rotation_degrees(0)# flip aim back
#		shot_aim = Vector2(15, -3)# moves offset where it fires from
