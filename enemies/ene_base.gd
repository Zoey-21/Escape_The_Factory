extends KinematicBody2D

onready var sprite = get_node("Sprite")#for filping sprite

var health = 5 #default health
var velo = Vector2(0, 0) #sets veloity to 0
var speed = 1#default speed
var knockback = false #is tacking knockback
var can_knockback = false # can tack knockback
var angle = Vector2(0,0)#angle to player

func _ready():
	var rand_speed = randi() % 10 + 1#gets a rand number between 1 and 10
	speed += rand_speed # add rand number to speed

func _physics_process(delta):
	if $"/root/Global".player != null:# if player is not null
		angle = get_angle_to($"/root/Global".player.get_position())# gets player position form global
	
		if $"/root/Global".player.get_position() < self.position: #if player is on the left 
			sprite.set_flip_h(true)# flip horazontal
		else:
			sprite.set_flip_h(false)# dont flip
	
	
	velo.x = cos(angle)#gets velo from angle 
	velo.y = sin(angle)
	if knockback == false:#if not in knockback
# warning-ignore:return_value_discarded
		move_and_collide(velo * speed * delta)# adds spped in the direction every physics frame(60sec)
	else:
# warning-ignore:return_value_discarded
		move_and_collide(-velo * speed * delta)#adds spped in the opposite direction every physics frame(60sec)
		
	if health <= 0:# if helth is zero run kill
		kill()# run func kill

func kill():
	queue_free() # remove ene from scene
	$"/root/Global".enedistroy.play() # play death sound

func _on_Area2D_body_entered(body):
	if "Player_Shot" in body.name: #if the player shot is what hit
		var damage = body.damage
		print(damage)
		health -= damage #helth - 1
		if can_knockback == true:# if can take knockback
			knockback = true
			yield(get_tree().create_timer(0.05), "timeout")#wait 0.05 sec
			knockback = false
