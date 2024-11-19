extends AudioStreamPlayer
# Singleton MusicPlayer

const BUS_NAME: StringName = &"Music"

func _ready() -> void:
	process_mode = PROCESS_MODE_ALWAYS
	stream = preload("res://assets/music.ogg")
	bus = BUS_NAME
	volume_db = -10.0
	play()
