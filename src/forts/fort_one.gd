extends Fort

func _ready() -> void:
	_add(ENEMIES.FIREBALL_THROWER if randi() % 2 else ENEMIES.CACTUS).position = Vector2(50, -104)
	_add(ENEMIES.FIREBALL_THROWER if randi() % 2 else ENEMIES.CACTUS).position = Vector2(210, -163)
	_add(ENEMIES.FIREBALL_THROWER if randi() % 2 else ENEMIES.CACTUS).position = Vector2(231, -75)
