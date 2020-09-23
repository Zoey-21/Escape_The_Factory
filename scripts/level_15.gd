extends "res://Level/level.gd"
var worp = false
#dog_walker_scene    floater_scene      floater_big_scene        shooter_scene     turret_scene       wait        stop

onready var cam = get_node("cam")

func _ready():
	cam.position = Vector2(324,244)
	spawns = [spawn_1]
	air_spawns = [air_spawn_1,air_spawn_2,air_spawn_3,air_spawn_4]
	turret_spawns = [] 
	
	NEED_TO_KILL = 6# amount of kills needed to win level    dont count turrets   count floater_big_scene twice
	spawn_list = [dog_walker_scene,wait,dog_walker_scene,dog_walker_scene,wait,dog_walker_scene,dog_walker_scene,dog_walker_scene,wait,
	
	floater_scene,floater_scene,floater_scene,floater_big_scene,shooter_scene,floater_big_scene,floater_scene,floater_scene,floater_scene,floater_scene,wait,wait,
	
	floater_scene,floater_scene,floater_scene,shooter_scene,dog_walker_scene,dog_walker_scene,dog_walker_scene,dog_walker_scene,shooter_scene,wait,wait,
	
	floater_scene,dog_walker_scene,dog_walker_scene,floater_scene,floater_scene,floater_scene,floater_scene,floater_scene,shooter_scene,wait,wait,wait,
	
	end_of_array]
	cur_level = 15

func _physics_process(delta):
	print(killed)
	if waiting != true:
		wait_timer.start()
	
	if NEED_TO_KILL <= killed:  
		worp = true 
		match NEED_TO_KILL:
			6:
				if spawns.has(spawn_1):
					spawns.erase(spawn_1)
					spawns.append(spawn_2)
					NEED_TO_KILL = NEED_TO_KILL + 10
			16:
				if spawns.has(spawn_2):
					spawns.erase(spawn_2)
					spawns.append(spawn_3)
					NEED_TO_KILL = NEED_TO_KILL + 9
			25:
				if spawns.has(spawn_3):
					spawns.erase(spawn_3)
					spawns.append(spawn_4)
					NEED_TO_KILL = NEED_TO_KILL + 9
	if worp == true:
		stop = true
	else:
		stop = false

func _on_waiting_timeout():
	if waiting == true:
		waiting = false


