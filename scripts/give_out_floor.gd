extends Node2D


onready var hit = get_node("hit_player/hit_player")
onready var stop = get_node("stop_player/stop_player")
onready var sprite = get_node("Sprite")
onready var falling = get_node("falling")

func _on_stop_player_body_exited(body):
	if body.is_in_group("walk"): #if the player shot is what hit
		sprite.play("fall")
		falling.play()
		stop.set_deferred("disabled", false)
		hit.set_deferred("disabled", true)



