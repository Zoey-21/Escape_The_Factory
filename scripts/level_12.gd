extends "res://Level/level.gd"

#dog_walker_scene    floater_scene      floater_big_scene        shooter_scene     turret_scene       wait        stop


func _ready():

	spawns = [spawn_1,spawn_2,spawn_3]
	air_spawns = [air_spawn_1,air_spawn_2,air_spawn_3,air_spawn_4]
	turret_spawns = [] 
	
	NEED_TO_KILL = 15# amount of kills needed to win level    dont count turrets   count floater_big_scene twice
	spawn_list = [dog_walker_scene,floater_scene,shooter_scene,floater_scene,floater_scene,shooter_scene,floater_big_scene,wait,
	
	dog_walker_scene,dog_walker_scene,dog_walker_scene,floater_big_scene,floater_big_scene,wait,
	
	dog_walker_scene,dog_walker_scene,shooter_scene,
	
	wait,wait,end_of_array]
	cur_level = 12

func _physics_process(delta):
	if waiting != true:
		wait_timer.start()
	print(killed)

func _on_waiting_timeout():
	if waiting == true:
		waiting = false
