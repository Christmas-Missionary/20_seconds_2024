extends Timer

var _times_to_play: int = 3

@onready var _audio: = $LowTimePlayer as AudioStreamPlayer

func _physics_process(_delta) -> void:
	if ((_times_to_play == 3 and time_left < 3.0)
	or  (_times_to_play == 2 and time_left < 2.0)
	or  (_times_to_play == 1 and time_left < 1.0)):
		MusicPlayer.set_stream_paused(true)
		_audio.play()
		_times_to_play -= 1
