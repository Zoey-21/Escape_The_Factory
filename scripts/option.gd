extends Node2D

onready var levels_beaten = get_node("/root/LevelsBeaten")
onready var yes = get_node("butten/delete/yes")
onready var no = get_node("butten/delete/no")
onready var text = get_node("butten/delete/text")
onready var options = get_node("/root/option_save")
onready var crt = get_node("/root/crt/crt")

onready var crt_botten = $butten/crt
onready var fullscreen_botten = $butten/fullscreen

func _ready():
	if options.data["crt"] == "true": crt_botten.pressed = true 
	else: crt_botten.pressed = false
#	if options.data["fullscreen"] == "true": fullscreen_botten.pressed =true
#	else: fullscreen_botten.pressed = false
	$butten/resolution.get_popup().add_item("800x600")
	$butten/resolution.get_popup().add_item("1024x768")
	$butten/resolution.get_popup().add_item("1400x1050")
	$butten/resolution.get_popup().add_item("1600x1200")



func _on_Button_pressed():
	options.save()
	get_tree().change_scene("res://Menus/Main_Menu.tscn")


func _on_delete_pressed():
	yes.set_visible(true)
	no.set_visible(true)
	text.set_visible(true)


func _on_yes_pressed():
	yes.set_visible(false)
	no.set_visible(false)
	text.set_visible(false)
	levels_beaten.delete()

func _on_no_pressed():
	yes.set_visible(false)
	no.set_visible(false)
	text.set_visible(false)


func _on_resolution_item_selected(index):
	var res = index
	print(res)
	match res:
		0:
			OS.set_window_size(Vector2(800,600))
			options.data["Resolution.x"] = 800
			options.data["Resolution.y"] = 600
		1:
			OS.set_window_size(Vector2(1024,768))
			options.data["Resolution.x"] = 1024
			options.data["Resolution.y"] = 768
		2:
			OS.set_window_size(Vector2(1400,1050))
			options.data["Resolution"] = "Vector2(1400x1050)"
			options.data["Resolution.x"] = 1400
			options.data["Resolution.y"] = 1050
		3:
			OS.set_window_size(Vector2(1600,1200))
			options.data["Resolution.x"] = 1600
			options.data["Resolution.y"] = 1200


func _on_fullscreen_toggled(button_pressed):
	if button_pressed == true:
		OS.window_fullscreen = true
		options.data["fullscreen"] = "true"
	else:
		OS.window_fullscreen = false
		options.data["fullscreen"] = "false"


func _on_default_pressed():
	options.delete()


func _on_crt_toggled(button_pressed):
	if button_pressed == true:
		crt.visible = true
		options.data["crt"] = "true"
	else:
		crt.visible = false
		options.data["crt"] = "false"
