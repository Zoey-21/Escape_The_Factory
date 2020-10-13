extends Node

var dog_walker_scene = load("res://enemies/dog_walker.tscn")# loading the dog_walker scene to instance
var floater_scene = load("res://enemies/floater.tscn")# loading the floater scene to instance
var floater_big_scene = load("res://enemies/floater_big.tscn")# loading the floater_big scene to instance
var shooter_scene = load("res://enemies/shooter.tscn")# loading the shooter scene to instance
var turret_scene = load("res://enemies/turret.tscn")

onready var wait_timer = get_node("waiting")
onready var levels_beaten = get_node("/root/LevelsBeaten")#its capatleised
onready var global = get_node("/root/Global")

# gets the spawn nodes to spawn enemes on 
onready var spawn_1 = get_node("spawn_1")
onready var spawn_2 = get_node("spawn_2")
onready var spawn_3 = get_node("spawn_3")
onready var spawn_4 = get_node("spawn_4")
onready var spawn_5 = get_node("spawn_5")
onready var air_spawn_1 = get_node("cam/air_spawn_1")
onready var air_spawn_2 = get_node("cam/air_spawn_2")
onready var air_spawn_3 = get_node("cam/air_spawn_3")
onready var air_spawn_4 = get_node("cam/air_spawn_4")
onready var turret_spawn_1 = get_node("turret_spawn_1")
onready var turret_spawn_2 = get_node("turret_spawn_2") 
onready var turret_spawn_3 = get_node("turret_spawn_3")
onready var turret_spawn_4 = get_node("turret_spawn_4")

var spawns = [spawn_1, spawn_2, spawn_3, spawn_4]# list spawns to randmize
var air_spawns = [air_spawn_1, air_spawn_2, air_spawn_3, air_spawn_4]# list air spawns to randmize
var turret_spawns = [turret_spawn_1, turret_spawn_2, turret_spawn_3, turret_spawn_4] # list turret spawns to randmize

var spawn_location = Vector2(0,0)# holds location of spawn location that has bean chosen randomly
var air_spawn_location = Vector2(0,0)# holds location of air spawn location that has bean chosen randomly
var turret_spawn_location = Vector2(0,0)

var spawner#hols whaere to spawn
var wait# used to start wait when put in spawn_list
var end_of_array# makes sure  every thing spawns

var waiting = false# is waiting 
var stop = false# has stoped

var last_spawn = 6

var killed = 0# holds amount of enemes killed
var NEED_TO_KILL = 30# amount of kills needed to win level
var cur_level = 0# what is the level

var spawn_list = []# holds things to spawn
var next_spawn = 0 # holds next to spawn in spawn_list
var spawned = 0# amount that has been spawned

func _ready():
	global.level_ended = false


func _physics_process(_delta):# makes random numbers for spawning
	if cur_level != 10 and killed < NEED_TO_KILL:
		music.play_music("res://Resorces/Sounds/music/level.wav",-8)
		
	if Input.is_action_pressed("level_exit"):
		get_tree().change_scene("res://Menus/Level_Menu.tscn")
		$"/root/Global".level_ended =true
	
	if killed >= NEED_TO_KILL: # if kills ar more or equle to needed to win the level 
		level_end()
		$"/root/Global".level_ended =true # go to level menu
		stop = true # has stopped
		
	if $"/root/Global".player.health <= 0:
		for child in self.get_children(): 
			if child.has_method("kill"): 
				child.queue_free()

func _on_Spawn_timeout():
	
	if stop == false && waiting == false:# if not waiting and not stoped
		var spawning = spawn_list[next_spawn]# takes the number next_spawn is on and grabs the enemy the is that number and puts that into spawning 
		
		if spawning == floater_scene or spawning == floater_big_scene:#if spawning is floater_scene or floater_big_scene spawn in air spawn
			spawner(air_spawns)
		elif spawning == dog_walker_scene or spawning == shooter_scene:#if spawning is dog_walker_scene or shooter_scene spawn in gound spawn
			spawner(spawns)
		elif spawning == turret_scene:#if spawning is dog_walker_scene or shooter_scene spawn in gound spawn
			spawner(turret_spawns)
		elif spawning == wait:#if spawning is wait
			waiting = true# is waiting
		
		if next_spawn >= (spawn_list.size() - 1): # if spawn is one less then the total of array spawn_list
			next_spawn = 0# reset next_spawn to zero
		else:
			next_spawn += 1# goto the next in the array 
		killed = spawned - get_tree().get_nodes_in_group("enemy").size() #killed = amount spawned - what was still on screen

func spawner(spawn_place):
	var spawning = spawn_list[next_spawn]
	var rand_numb = randi() % spawn_place.size() + 1 # makes random number from 1 to size of spawns\
	if spawn_place == turret_spawns:
		
		match rand_numb:# switch   take random number and matches it to a spawn lin the array spawn then add it to spawn_location
			1:
				spawn_location = spawn_place[0].get_global_position()
				spawner = spawn_place[0]
			2:
				spawn_location = spawn_place[1].get_global_position()
				spawner = spawn_place[1]
			3:
				spawn_location = spawn_place[2].get_global_position()
				spawner = spawn_place[2]
			4:
				spawn_location = spawn_place[3].get_global_position()
				spawner = spawn_place[3]
			5:
				spawn_location = spawn_place[4].get_global_position()
				spawner = spawn_place[4]

		var spawn = spawning.instance()# make a instance of whats in spawning called spawn
		spawn.position.y = spawn_location.y# make spawn goto spawn location's y qurondnet
		spawn.position.x = spawn_location.x# make spawn goto spawn location's x qurondnet
		spawner.play()
		add_child(spawn)# adds spawn as a child of the leval
		spawned += 1# add one to spawned
		
	else:
		
		if last_spawn == rand_numb and spawn_place.size() > 1:
			print(last_spawn)
			spawner(spawn_place)
		else:
			last_spawn = rand_numb
			match rand_numb:# switch   take random number and matches it to a spawn lin the array spawn then add it to spawn_location
				1:
					spawn_location = spawn_place[0].get_global_position()
					spawner = spawn_place[0]
				2:
					spawn_location = spawn_place[1].get_global_position()
					spawner = spawn_place[1]
				3:
					spawn_location = spawn_place[2].get_global_position()
					spawner = spawn_place[2]
				4:
					spawn_location = spawn_place[3].get_global_position()
					spawner = spawn_place[3]
				5:
					spawn_location = spawn_place[4].get_global_position()
					spawner = spawn_place[4]

			var spawn = spawning.instance()# make a instance of whats in spawning called spawn
			spawn.position.y = spawn_location.y# make spawn goto spawn location's y qurondnet
			spawn.position.x = spawn_location.x# make spawn goto spawn location's x qurondnet
			spawner.play()
			add_child(spawn)# adds spawn as a child of the leval
			spawned += 1# add one to spawned
			

func level_end():

		music.stop()
		music.reset()
		match cur_level:# takes the curent level and health of player and sets true the data holding whether the level has bean beaten and if it was done hitless
			1:  
				save("level_1", "level_1_hitless")
			2: 
				save("level_2", "level_2_hitless")
			3: 
				save("level_3", "level_3_hitless")
			4: 
				save("level_4", "level_4_hitless")
			5: 
				save("level_5", "level_5_hitless")
			6: 
				save("level_6", "level_6_hitless")
			7: 
				save("level_7", "level_7_hitless")
			8: 
				save("level_8", "level_8_hitless")
			9: 
				save("level_9", "level_9_hitless")
			10: 
				save("level_10", "level_10_hitless")
			11: 
				save("level_11", "level_11_hitless")
			12: 
				save("level_12", "level_12_hitless")
			13: 
				save("level_13", "level_13_hitless")
			14: 
				save("level_14", "level_14_hitless")
			15: 
				save("level_15", "level_15_hitless")
			16: 
				save("level_16", "level_16_hitless")
					
func save(level, level_hitless):
	levels_beaten.level_data[level] = "true"
	if $"/root/Global".player.health == 3:
		levels_beaten.level_data[level_hitless] = "true"
		
	levels_beaten.save()
