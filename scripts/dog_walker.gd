extends "res://enemies/ene_base.gd"

const MAX_SPEED = 300# max speed it can move at
const MIN_SPEED = 100# min speed it can move at
var speed_going_up = true #store witch way the speed is going



func _ready():
	health = 6# the health it has
	speed = 100#the speed it starts at
	can_knockback = true# can take knockback

func _physics_process(delta):
	if speed_going_up == true:
		if (speed < MAX_SPEED):# if speed is less than max speed
			speed = speed + 2# add 2 to speed
	else:
		if (speed > MIN_SPEED):# if speed is less than max speed
			speed = speed - 1# add 1 to speed
	
	if speed == MAX_SPEED:#if speed is at the max
		speed_going_up = false# start going down
	elif speed == MIN_SPEED:# if speed is at the min
		speed_going_up = true# start going up
