extends AudioStreamPlayer2D


func _ready():#sends position to global for use in ai
	$"/root/Global".play_shotdespawn(self) #sends position to global for use in ai
