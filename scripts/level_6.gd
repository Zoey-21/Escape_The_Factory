extends "res://Level/level.gd"

#dog_walker_scene    floater_scene      floater_big_scene        shooter_scene     turret_scene       wait        stop


func _ready():

	spawns = [spawn_1]
	air_spawns = [air_spawn_1,air_spawn_2,air_spawn_3,air_spawn_4]
	turret_spawns = [turret_spawn_1,turret_spawn_2] 
	
	NEED_TO_KILL = 18# amount of kills needed to win level    dont count turrets   count floater_big_scene twice
	spawn_list = [floater_scene,floater_scene,floater_scene,floater_scene,floater_scene,wait,\
	turret_scene,floater_scene,floater_scene,shooter_scene,floater_big_scene,wait,\
	turret_scene,floater_big_scene,floater_big_scene,shooter_scene,wait,
	floater_scene,floater_scene,floater_scene,floater_big_scene,
	
	wait,wait,end_of_array]
	cur_level = 6

func _physics_process(delta):
	if waiting != true:
		wait_timer.start()

func _on_waiting_timeout():
	if waiting == true:
		waiting = false
