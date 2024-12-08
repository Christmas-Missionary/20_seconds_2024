extends Fort

func _ready() -> void:
	_add(ENEMIES.FIREBALL_THROWER).position = Vector2(190, -70)
	if (randi() % 2):
		_add(ENEMIES.CACTUS).position = Vector2(50, -45)
	if (randi() % 2):
		_add(ENEMIES.CACTUS).position = Vector2(210, -45)
	if (randi() % 2):
		_add(ENEMIES.BOUNCE_PAD).position = Vector2(170, -103)
		if !(randi() % 10):
			_add(ENEMIES.BOUNCE_PAD).position = Vector2(170, -113)
	
