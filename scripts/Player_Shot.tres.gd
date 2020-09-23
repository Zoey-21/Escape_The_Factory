extends RigidBody2D

var explution = preload("res://explotion/Explotion.tscn")#loads explotion to play
onready var sm_spr = get_node("sprite")
onready var big_spr = get_node("big_sprite")
onready var collition = get_node("CollisionShape2D")
onready var damage = $"/root/Global".player.damage

func _ready():
	if damage == 1:
		big_spr.set_visible(false)
		
	else:
		big_spr.set_visible(true)
		collition.set_scale(Vector2(2,2))
	

func _physics_process(_delta):
	if $"/root/Global".level_ended ==true:
		queue_free()
	
	
	if  !get_node("notifier").is_on_screen():
		queue_free()


func _on_Player_Shot_body_entered(body):
	if !body.is_in_group("player"): #if hitting not player
		var explution_instance = explution.instance() #make explotion instance
		explution_instance.position = get_global_position() #get location of hit
		get_tree().get_root().add_child(explution_instance) #show explotion
		kill()#deleate bullet

func kill():# deleate bullet
		$"/root/Global".playershothit.play()#play hit sound
		queue_free()#remove from tree
