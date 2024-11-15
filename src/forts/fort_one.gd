extends Fort

func _ready() -> void:
	_add(ENEMIES.FIREBALL_THROWER if randi() % 2 else ENEMIES.CACTUS).position = Vector2(50, -104)
	_add(ENEMIES.FIREBALL_THROWER if randi() % 2 else ENEMIES.CACTUS).position = Vector2(210, -163)
	_add(ENEMIES.FIREBALL_THROWER if randi() % 2 else ENEMIES.CACTUS).position = Vector2(231, -75)
	if !(randi() % 12):
		_add(ENEMIES.DUST_DEVIL).position = Vector2(440, -25)
