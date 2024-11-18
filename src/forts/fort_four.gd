extends Fort

func _ready() -> void:
	_add(ENEMIES.TUMBLEWEED).position = Vector2(randf_range(135, 248), -32)
	_add(ENEMIES.BOUNCE_PAD).position = Vector2(randf_range(31, 49), -23)
	var bouncing_pos: Vector2 = Vector2(randf_range(111, 289), -183)
	_add(ENEMIES.BOUNCE_PAD).position = bouncing_pos
	_add(ENEMIES.CACTUS).position = bouncing_pos + Vector2(0, -20)
	if randi() % 2:
		_add(ENEMIES.CACTUS).position = bouncing_pos + Vector2(0, -70)
	if randi() % 5:
		set_cell(Vector2i(4, -10), -1, Vector2i.ZERO)
	if !(randi() % 8):
		_add(ENEMIES.BOUNCE_PAD).position = Vector2(110, -23)
	if randi() % 2:
		set_cell(Vector2i(8, -6), -1, Vector2i.ZERO)
		_add(ENEMIES.FIREBALL_THROWER).position = Vector2(170, -110)
