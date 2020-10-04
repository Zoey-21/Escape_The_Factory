extends KinematicBody2D

onready var sprite = get_node("sprite") #graps sprite node to play animations to
onready var invin_timer = get_node("invin_timer")
onready var hitbox = get_node("hit_box/hit_box")

const MAX_SPEED = 300# max speed whent not dashing
const MAX_DASH_SPEED = 100# max spped when  dashing
const ACCELERATION = 4000# acceration when moveing
var motion = Vector2.ZERO# holds direction of movement

var dashing = false # whether you are dashing or not
var invin = false# if cant take damage
var damage = 1

var anim = "idle"# holds anomation to play

const MAX_HEALTH = 3# masumum health for player
var health = 3# health when bing hit
var health_color = Color()# stores color of player when hit

onready var slime = get_node("../slime_boss")
var force = 100
var slime_volo = Vector2(0, 0)
var slime_angle 

func _ready():#sends position to global for use in ai
	$"/root/Global".regaster_player(self) #sends position to global for use in ai

func _physics_process(delta):
	
	if visible:# if alive
		var axis = get_input_axis() #makes anwored of func get_input_axis() a var
		if axis == Vector2.ZERO:  #if no input
			apply_friction(ACCELERATION * delta) #aply force in curint direction
		else:
			apply_movement(axis * ACCELERATION * delta) #aply force in input direction
		motion = move_and_slide(motion)# adds colition
		
		if Input.is_action_pressed("dash") : # if you pressed the dash butten and are not dashing and the dash cooldown isnt happoning
			dashing = true # start dashing
		else:
			dashing = false
			

	
	#animation
		if axis == Vector2(0,0): #if no input
			anim = "idle" #set animation to play as idle
		else:
			anim = "running"
		if axis.x > 0: #if going right
			sprite.set_flip_h(false)#face sprite right
		elif axis.x < 0:#if going left
			sprite.set_flip_h(true)#face sprite left
		sprite.play(anim)
		

		
		match health: # asks whats health to make the player the right color
			3:
				health_color = Color( 1, 1, 1 )# normal at 3 hp
			2:
				health_color = Color(0.812, 0.451, 0.451)# light red at 2 
			1:
				health_color = Color(0.49, 0.169, 0.169)# deap red at 1
			
		if dashing == true: #if dashing
			sprite.self_modulate= Color(0.247, 0.247, 0.714) #change to a blue
			damage = 2
		else:# if not
			sprite.self_modulate = health_color# use the health color
			damage = 1
	
	
	if health <= 0:# if health is zero run kill
		kill()
		
	if slime != null:
		if $"/root/Global".boss_start == true:
			slime_angle = get_angle_to(slime.get_position())
			slime_volo.x = cos(slime_angle)#gets velo from angle
			slime_volo.y = sin(slime_angle)
			move_and_collide(slime_volo * force * delta)
			
			
func get_input_axis():# gets what buttens the player is pressing
	var axis = Vector2.ZERO # sets up variable to hold inputs
	axis.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))   #if one is presed it a 1  if 1 - 1 =0 no movment 1 - 0 = 1 right movment 0-1=-1 left movment
	axis.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up")) #if one is presed it a 1  if 1 - 1 =0 no movment 1 - 0 = 1 down movment 0-1=-1 up movment
	return axis.normalized()# makes it all 1s
 
func apply_friction(amount):
	if motion.length() > amount:
		motion -= motion.normalized() * amount #remove force instead of imidly moving in other direction
	else:
		motion = Vector2.ZERO

func apply_movement(acceleration):# adds speed and capes it depening if you are dashing or not
	motion += acceleration  #add speed to player
	if dashing == true: # if dashing
		motion = motion.clamped(MAX_DASH_SPEED)# use dashing speed
	else:
		motion = motion.clamped(MAX_SPEED) #use normal speed


func kill():
	$"/root/Global".level_ended = true
	visible = false #makes player disaper
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Menus/Level_Menu.tscn")

func _on_hit_box_body_entered(body): #enemy detection
	if body.is_in_group("enemy") or body.is_in_group("ene_shot"):
		health -= 1 #helth - 1
		if invin == false:#if not invinceable
			sprite.modulate.a = 0.50# make 50% tranusent
			hitbox.set_deferred("disabled", true)# disable hitbox
			invin_timer.start()# start timer for invicablaty
			invin = true# is invincable
		if health > 0:#if health is more than 0
			$"/root/Global".playerhit.play()#play hit sound

func _on_invin_timer_timeout():# after inviablity
	sprite.modulate.a = 1#no longer tranluant
	hitbox.set_deferred("disabled", false)#hitbox enabled
	invin = false# no longer invincable


