extends "res://Level/level.gd"

#dog_walker_scene    floater_scene      floater_big_scene        shooter_scene     wait        stop

func _ready():
	spawns = [spawn_1, spawn_2]
	air_spawns = [air_spawn_1, air_spawn_2]
	turret_spawns = [] 
	
	NEED_TO_KILL = 8# amount of kills needed to win level
	spawn_list = [floater_scene,floater_scene,dog_walker_scene,wait, floater_scene,floater_scene,wait, floater_scene,dog_walker_scene,floater_scene,wait,wait, end_of_array]
	cur_level = 2

func _physics_process(_delta):
	if waiting != true:
		wait_timer.start()

func _on_waiting_timeout():
	if waiting == true:
		waiting = false
