extends "res://Level/level.gd"

#dog_walker_scene    floater_scene      floater_big_scene        shooter_scene     turret_scene       wait        stop
onready var dark_start = get_node("dark_start")
onready var flash = get_node("darkness_flash")
onready var darkness = get_node("CanvasLayer/darkness")
onready var thunder = get_node("thunder")
func _ready():
	
	spawns = [spawn_1,spawn_2,spawn_3,spawn_4]
	air_spawns = [air_spawn_1,air_spawn_2,air_spawn_3,air_spawn_4]
	turret_spawns = [turret_spawn_1,turret_spawn_2] 
	
	NEED_TO_KILL = 17# amount of kills needed to win level    dont count turrets   count floater_big_scene twice
	spawn_list = [wait,wait,dog_walker_scene,floater_scene,shooter_scene,wait,
	
	floater_scene,dog_walker_scene,floater_scene,floater_big_scene,wait,
	
	turret_scene,wait,
	
	floater_scene,floater_scene,shooter_scene,dog_walker_scene,dog_walker_scene,wait,
	
	turret_scene,wait,
	
	floater_big_scene,shooter_scene,dog_walker_scene,
	
	wait,wait,end_of_array]
	cur_level = 10

func _physics_process(delta):
	if waiting != true:
		wait_timer.start()

func _on_waiting_timeout():
	if waiting == true:
		waiting = false


func _on_darkness_flash_timeout():
	music.play_music("res://Resorces/Sounds/music/level.wav",-8)
	dark_start.interpolate_property(darkness, "modulate", Color(1, 1, 1, 0.35), Color(1, 1, 1, 0.90), 2, Tween.TRANS_CUBIC, Tween.EASE_OUT)
	dark_start.start()
	thunder.play()
