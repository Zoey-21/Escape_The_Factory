extends Control

onready var levels_beaten = get_node("/root/LevelsBeaten")
onready var tie = get_node("panel/text_interface_engine")
onready var one = get_node("one")
onready var two = get_node("two")

func text():
	tie.reset()
	tie.set_color(Color(1,1,1))
	# Buff text: "Text", duration (in seconds) of each letter
	tie.buff_text("Jim, a worker at the robot factory, was working on the job like any other day...\n", 0.1)
	# Buff silence: Duration of the silence (in seconds)
	tie.buff_silence(1)
	tie.buff_text("Humming, they kept an eye onto the finished robots for physical problems\n", 0.1)
	tie.buff_text("But hidden on the other side of the conveyor belt... \n", 0.1)
	tie.buff_text("A living slime was adding itself to the robots,\n", 0.1)
	tie.buff_text("And the robots came to life!\n", 0.1)
	tie.buff_silence(1)
	tie.buff_text("Seeing this Jim ran to the nearest portal and sounded the alarm for evacuation.", 0.1) 
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


func _on_level_menu_timeout():
	levels_beaten.level_data["start_game"] = "true"
	levels_beaten.save()
	get_tree().change_scene("res://Menus/Level_Menu.tscn")
