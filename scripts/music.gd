extends AudioStreamPlayer

var time = 0

func play_music(audio,vol):
	audio = load(audio)
	if audio != stream:
		self.set_stream(audio)
		self.set_volume_db(vol)
		self.play()

func save():
	time = get_playback_position()
	stop()

func start():
	play(time)

func reset():
	time = 0
