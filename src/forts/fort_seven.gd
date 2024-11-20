extends Fort

func _ready() -> void:
	if randi() % 2:
		return
	var thrower_spawn_pos: Vector2 = Vector2(130, -90)
	for _i in (randi() % 4) + 1:
		_add(ENEMIES.FIREBALL_THROWER).position = thrower_spawn_pos
		thrower_spawn_pos += Vector2(60, -60)
	if randi() % 2:
		_add(ENEMIES.TUMBLEWEED).position = Vector2(randf_range(200, 390), -32)
