extends Node2D

onready var portal = get_node("on") #geting sprite for actovating
onready var collition = get_node("StaticBody2D/CollisionPolygon2D") # geting collition for turing on 
onready var global = get_node("/root/Global")#gets global for seeing if the level has ended
onready var level = get_tree().get_current_scene()

var level_done = false# if the level is done
var sound_has_played = false# has the sound played

func _ready():
	$"/root/Global".level_end(self)#sends itself to the global to use in the level script

func _physics_process(_delta):
	if global.level_ended == true:# if the level is done
		collition.set_disabled(false)# turn on the collition
		portal.set_visible(true)#makes the portal visable
		
		if !sound_has_played:# if the sound has not played
			sound_has_played = true#show sound has played
			$"/root/Global".portalopen.play()# play sound
			
	else:
		portal.set_visible(false)# portal is not visable
		collition.set_disabled(true)#collition is off


func _on_StaticBody2D_body_entered(body):# if something tuches the portal
	if "Player" in body.name: #if the player tuches the portal
# warning-ignore:return_value_discarded
		get_tree().change_scene("res://Menus/Level_Menu.tscn") # go to level menu
		
