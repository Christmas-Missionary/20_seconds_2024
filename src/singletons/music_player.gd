extends AudioStreamPlayer

func _ready() -> void:
	process_mode = PROCESS_MODE_ALWAYS
	stream = preload("res://assets/music.ogg")
	bus = &"Music"
	play()