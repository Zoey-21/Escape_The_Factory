extends Node


var save_path = "user://save.dat"

var level_data_default = {
	"start_game" : "false",
	"level_1" : "false",
	"level_2" : "false",
	"level_3" : "false",
	"level_4" : "false",
	"level_5" : "false",
	"level_6" : "false",
	"level_7" : "false",
	"level_8" : "false",
	"level_9" : "false",
	"level_10" : "false",
	"level_11" : "false",
	"level_12" : "false",
	"level_13" : "false",
	"level_14" : "false",
	"level_15" : "false",
	"level_16" : "false",
	"level_1_hitless" : "false",
	"level_2_hitless" : "false",
	"level_3_hitless" : "false",
	"level_4_hitless" : "false",
	"level_5_hitless" : "false",
	"level_6_hitless" : "false",
	"level_7_hitless" : "false",
	"level_8_hitless" : "false",
	"level_9_hitless" : "false",
	"level_10_hitless" : "false",
	"level_11_hitless" : "false",
	"level_12_hitless" : "false",
	"level_13_hitless" : "false",
	"level_14_hitless" : "false",
	"level_15_hitless" : "false",
	"level_16_hitless" : "false",
	}

var level_data = {
	"start_game" : "false",
	"level_1" : "false",
	"level_2" : "false",
	"level_3" : "false",
	"level_4" : "false",
	"level_5" : "false",
	"level_6" : "false",
	"level_7" : "false",
	"level_8" : "false",
	"level_9" : "false",
	"level_10" : "false",
	"level_11" : "false",
	"level_12" : "false",
	"level_13" : "false",
	"level_14" : "false",
	"level_15" : "false",
	"level_16" : "false",
	"level_1_hitless" : "false",
	"level_2_hitless" : "false",
	"level_3_hitless" : "false",
	"level_4_hitless" : "false",
	"level_5_hitless" : "false",
	"level_6_hitless" : "false",
	"level_7_hitless" : "false",
	"level_8_hitless" : "false",
	"level_9_hitless" : "false",
	"level_10_hitless" : "false",
	"level_11_hitless" : "false",
	"level_12_hitless" : "false",
	"level_13_hitless" : "false",
	"level_14_hitless" : "false",
	"level_15_hitless" : "false",
	"level_16_hitless" : "false",
	}

func save():
	
	var file = File.new()#makes a new file for saveing
	var error = file.open(save_path, File.WRITE)#opens file to write to
	if error == OK:# makes sure file loaded corectly
		file.store_var(level_data)#stores info to file
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
			level_data = levels
		else:
			print(error)

func delete():
	level_data = level_data_default #sets eveything to false
	var file = File.new()#makes a new file for saveing
	var error = file.open(save_path, File.WRITE)#opens file to write to
	if error == OK:# makes sure file loaded corectly
		file.store_var(level_data)#stores info to file
		file.close()#stops wrighting to file
	else:
		print(error)
