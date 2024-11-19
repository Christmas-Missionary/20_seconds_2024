extends Button

func _ready() -> void:
	pressed.connect(get_tree().set_pause.bind(false))

@onready var _game_timer: = $/root/Main/CanvasLayer/UI/Labels/TimeLeft/GameTimer as Timer

func _check_game_time() -> void:
	if _game_timer.time_left < 3.0:
		MusicPlayer.set_stream_paused(true)
