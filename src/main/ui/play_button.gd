extends Button

func _ready() -> void:
	pressed.connect(get_tree().set_pause.bind(false))
	if GameStats.is_respawning_automatically:
		pressed.emit()
	else:
		get_tree().set_pause(true)

@onready var _game_timer: = $/root/Main/CanvasLayer/UI/Labels/TimeLeft/GameTimer as Timer

func _check_game_time() -> void:
	if _game_timer.time_left < 3.0:
		MusicPlayer.set_stream_paused(true)
