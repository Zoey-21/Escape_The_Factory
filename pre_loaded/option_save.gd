extends Node


var save_path = "user://options.dat"

var data_default = {
	"Resolution" : "Vector2(800,600)",
	"fullscreen" : "false",
	}

var data = {
	"Resolution" : "Vector2(800,600)",
	"fullscreen" : "false",
	}

func save():
	
	var file = File.new()#makes a new file for saveing
	var error = file.open(save_path, File.WRITE)#opens file to write to
	if error == OK:# makes sure file loaded corectly
		file.store_var(data)#stores info to file
		file.close()#stops wrighting to file
	else:
		print(error)

func loading():
	var file = File.new()#loads file 
	if file.file_exists(save_path):# if file exists
		var error = file.open(save_path, File.READ)#file gets read
		if error == OK:
			var levels = file.get_var()
			file.close()
			data = levels
		else:
			print(error)

func delete():
	data = data_default #sets eveything to false
	var file = File.new()#makes a new file for saveing
	var error = file.open(save_path, File.WRITE)#opens file to write to
	if error == OK:# makes sure file loaded corectly
		file.store_var(data)#stores info to file
		file.close()#stops wrighting to file
	else:
		print(error)
