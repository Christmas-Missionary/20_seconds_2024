extends Fort

func _ready() -> void:
	_add(ENEMIES.TUMBLEWEED).position = Vector2(randf_range(190, 230), -30)
	_add(ENEMIES.TUMBLEWEED if randi() % 2 else ENEMIES.BOUNCE_PAD).position = Vector2(randf_range(130, 190), -143)
	if (randi() % 2):
		_set_block(Vector2i(8, -6), false)
		_add(ENEMIES.FIREBALL_THROWER).position = Vector2(170, -110)
	var code: int = randi() % 3
	if (code >= 1):
		_add(ENEMIES.CACTUS).position = Vector2(250, -46)
	if (code == 2):
		_add(ENEMIES.CACTUS).position = Vector2(250, -96)
