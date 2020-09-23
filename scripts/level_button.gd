extends Button

onready var levels_beaten = get_node("/root/LevelsBeaten")

export (int) var level#what level the butten is
export (String) var level_to_load# what sence to load when press
export (bool) var enabled# if its visable

onready var lable = get_node("Label")#writes level on butten
onready var button = get_node(".")
onready var nodam = get_node("nodamg")#to change no damage icon

func _ready():
	lable.text = String(level)# makes the lable say what level the butten is
	
	match level:#sets the no damage icon on or off for each level
		1:  
			hitless("level_1_hitless")
		2: 
			hitless("level_2_hitless")
		3: 
			hitless("level_3_hitless")
		4: 
			hitless("level_4_hitless")
		5: 
			hitless("level_5_hitless")
		6: 
			hitless("level_6_hitless")
		7: 
			hitless("level_7_hitless")
		8: 
			hitless("level_8_hitless")
		9: 
			hitless("level_9_hitless")
		10: 
			hitless("level_10_hitless")
		11: 
			hitless("level_11_hitless")
		12: 
			hitless("level_12_hitless")
		13: 
			hitless("level_13_hitless")
		14: 
			hitless("level_14_hitless")
		15: 
			hitless("level_15_hitless")
		16: 
			hitless("level_16_hitless")

func hitless(levels):
	if levels_beaten.level_data[levels] == "true":
		nodam.set_animation("on")
	else:
		nodam.set_animation("off")


func _on_level_button_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene(level_to_load)# go to level in level_to_load
