extends Node2D

onready var tele_1 = get_node("../teleporter_1")
onready var tele_2 = get_node("../teleporter_2")
onready var tele_3 = get_node("../teleporter_3")
onready var tele_4 = get_node("../teleporter_4")
onready var portal = get_node("on")
onready var collition = get_node("StaticBody2D/CollisionPolygon2D")
onready var cooldown = get_node("cooldown")
var portals = []


func _ready():
	$"/root/Global".next_tele = 0
	$"/root/Global".can_tele = true
	if tele_1 != null:
		portals.append(tele_1)
	if tele_2 != null:
		portals.append(tele_2)
	if tele_3 != null:
		portals.append(tele_3)
	if tele_4 != null:
		portals.append(tele_4)
		
	print(portals)
	
func _physics_process(delta):
	if $"/root/Global".next_tele > portals.size() - 1: $"/root/Global".next_tele = 0
	

func _on_StaticBody2D_body_entered(body):
	if !body.is_in_group("ene_shot"):
		if $"/root/Global".can_tele == true:
			if portals[$"/root/Global".next_tele].name != self.name:
				body.position.x =  portals[$"/root/Global".next_tele].position.x
				body.position.y =  portals[$"/root/Global".next_tele].position.y
			else:
				body.position.x =  portals[$"/root/Global".next_tele -1].position.x
				body.position.y =  portals[$"/root/Global".next_tele -1].position.y
			$"/root/Global".next_tele += 1
		if $"/root/Global".next_tele > portals.size() - 1: $"/root/Global".next_tele = 0
		print($"/root/Global".next_tele)
		collition.set_deferred("disabled", true)# turn on the collition
		portal.set_visible(true)#makes the portal visable
		$"/root/Global".portalopen.play()# play sound
		$"/root/Global".can_tele = false
		cooldown.start()


func _on_cooldown_timeout():
		collition.set_disabled(false)# turn on the collition
		portal.set_visible(false)#makes the portal visable
		$"/root/Global".can_tele = true
