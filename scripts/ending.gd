extends Control

onready var levels_beaten = get_node("/root/LevelsBeaten")
onready var tie = get_node("panel/text_interface_engine")
onready var one = get_node("one")
onready var two = get_node("two")
onready var three = get_node("three")

func text():
	tie.reset()
	tie.set_color(Color(1,1,1))
	# Buff text: "Text", duration (in seconds) of each letter
	tie.buff_text("Jim had done it! They had defeated the slime infecting the robots!\n", 0.1)
	# Buff silence: Duration of the silence (in seconds)
	tie.buff_silence(5)
	tie.buff_text("Behind the slime was one of the exits to the factory. \n", 0.1)
	tie.buff_text("The door slides open and Jim walks out to the outside.\n", 0.1)
	tie.buff_text("The End!\n", 0.1)
	tie.buff_text("Congratulations!\n", 0.1)
	tie.buff_silence(3)
	tie.set_state(tie.STATE_OUTPUT)

func _ready():

	tie.connect("input_enter", self, "_on_input_enter")
	tie.connect("buff_end", self, "_on_buff_end")
	tie.connect("state_change", self, "_on_state_change")
	tie.connect("enter_break", self, "_on_enter_break")
	tie.connect("resume_break", self, "_on_resume_break")
	tie.connect("tag_buff", self, "_on_tag_buff")
	text()


func _on_switch_timeout():
	one.set_deferred("visible", false)
	two.set_deferred("visible", true)

func _on_switch_2_timeout():
	two.set_deferred("visible", false)
	three.set_deferred("visible", true)

func _on_level_menu_timeout():
	get_tree().change_scene("res://Menus/Level_Menu.tscn")

