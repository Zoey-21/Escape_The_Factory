extends KinematicBody2D

var bullet = preload("res://Player/Player_Shot.tscn")# Loads shot to be fired

export var bullet_speed = 500# speed for the bullet to move at

func _process(_delta):
	look_at(get_global_mouse_position())# makes the aiming box aim at the mouse 
	if Input.is_action_just_pressed("shoot"): # if the player hit the shoot button
		if $"/root/Global".level_ended == false:#cant shoot if the level has ended
			var bullet_instance = bullet.instance() # set up a instance of the bullet
			bullet_instance.position = get_global_position() #gives bullet player position
			bullet_instance.rotation_degrees = get_angle_to(get_global_mouse_position()) #gives bullet the aiming box rotation
			bullet_instance.apply_central_impulse( Vector2(bullet_speed, 0).rotated(rotation)) #aplies force in direction aimed at
			get_tree().get_root().add_child(bullet_instance) # adds bullet to the root of the map
			$"/root/Global".playerfire.play()#play the fireing sound

