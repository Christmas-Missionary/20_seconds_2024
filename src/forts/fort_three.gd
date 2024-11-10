extends Fort

func _ready() -> void:
	var val: int = randi() % 6
	if (val >= 1):
		_add(ENEMIES.FIREBALL_THROWER).position = Vector2(170, -80)
	if (val >= 2):
		_add(ENEMIES.FIREBALL_THROWER).position = Vector2(190, -80)
	if (val >= 3):
		_add(ENEMIES.FIREBALL_THROWER).position = Vector2(170, -100)
	if (val >= 4):
		_add(ENEMIES.FIREBALL_THROWER).position = Vector2(190, -100)
	if (val >= 5):
		_add(ENEMIES.TUMBLEWEED).position = Vector2(190, -120)
	
	
