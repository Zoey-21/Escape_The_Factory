extends Area2D

onready var tele_1 = get_node("../spawn_1")
onready var tele_2 = get_node("../spawn_2")
onready var tele_3 = get_node("../spawn_3")
onready var tele_4 = get_node("../spawn_4")
onready var collition = get_node("StaticBody2D/CollisionPolygon2D")
onready var level = get_node("..")
onready var cam = get_node("../cam")
onready var tween = get_node("../tween")
onready var spawn_light = get_node("spawn_light")
var portals = []
var sound_has_played = false
var cam_pos_1 = Vector2(324,244)
var cam_pos_2 = Vector2(1540,372)
var cam_pos_3 = Vector2(932,980)
var cam_pos_4 = Vector2(1352,1644)


func _physics_process(delta):
	if level.worp == true: 
		collition.set_deferred("disabled", false)
		spawn_light.set_visible(true)#makes the portal visable
		$"/root/Global".can_tele = true
		if !sound_has_played:# if the sound has not played
			sound_has_played = true# sound has played
			$"/root/Global".portalopen.play()# play sound
	else:
		collition.set_disabled(true)# turn on the collition
		spawn_light.set_visible(false)#makes the portal visable


func _on_StaticBody2D_body_entered(body):
	if body.is_in_group("Player"):
		if $"/root/Global".can_tele == true:
			match self.name:
				tele_1.name:
					body.position.x =  tele_2.position.x
					body.position.y =  tele_2.position.y
					tween.interpolate_property(cam, "position", cam_pos_1, cam_pos_2, 0.2, Tween.TRANS_LINEAR, Tween.EASE_OUT)
					tween.start()
				tele_2.name:
					body.position.x =  tele_3.position.x
					body.position.y =  tele_3.position.y
					tween.interpolate_property(cam, "position", cam_pos_2, cam_pos_3, 0.2, Tween.TRANS_LINEAR, Tween.EASE_OUT)
					tween.start()
				tele_3.name:
					body.position.x =  tele_4.position.x
					body.position.y =  tele_4.position.y
					tween.interpolate_property(cam, "position", cam_pos_3, cam_pos_4, 0.2, Tween.TRANS_LINEAR, Tween.EASE_OUT)
					tween.start()
			level.worp = false
			$"/root/Global".portalopen.play()# play sound
			$"/root/Global".can_tele = false
			sound_has_played = false
			
func play():
	pass
