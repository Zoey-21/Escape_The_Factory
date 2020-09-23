extends AudioStreamPlayer


func _ready():#sends position to global for use in ai
	$"/root/Global".play_playerfire(self) #sends position to global for use in ai
