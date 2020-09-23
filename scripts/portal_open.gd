extends AudioStreamPlayer


func _ready():#sends position to global for use in ai
	$"/root/Global".play_portalopen(self) #sends position to global for use in ai
