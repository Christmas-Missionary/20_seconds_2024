extends Fort

func _ready() -> void:
	_set_block(Vector2i(7, -5), true)
	_add(ENEMIES.BOUNCE_PAD).position = Vector2(150, -105)
	if randi() % 2:
		_add(ENEMIES.BOUNCE_PAD).position = Vector2(10, -94)
