extends KinematicBody2D

onready var light = get_node("spawn_light")
onready var timer = get_node("anima_timer")
onready var slime = get_node("../slime_boss")
var num = 0
var force = 100
var slime_volo = Vector2(0, 0)
var slime_angle 

func play():
	timer.start()
	
func _physics_process(delta):
	if slime != null:
		if $"/root/Global".boss_start == true:
			slime_angle = get_angle_to(slime.get_position())
			slime_volo.x = cos(slime_angle)#gets velo from angle
			slime_volo.y = sin(slime_angle)
			move_and_collide(slime_volo * force * delta)

	

func _on_anima_timer_timeout():
	match num:
		0:
			light.set_visible(true)
			$"/root/Global".enespawn.play()
		1:
			light.set_frame(3)
		2:
			light.set_frame(2)
		3:
			light.set_frame(0)
		4:
			light.set_visible(false)
	
	if num == 4:
		num = 0
	else:
		num += 1
		timer.start()
		
