extends Fort

func _ready() -> void:
	if randi() % 2:
		_add(ENEMIES.BOUNCE_PAD).position = Vector2(50, -23)
	if randi() % 2:
		_add(ENEMIES.BOUNCE_PAD).position = Vector2(150, -143)
	if randi() % 2:
		_add(ENEMIES.BOUNCE_PAD).position = Vector2(290, -183)
	if randi() % 2:
		_add(ENEMIES.TUMBLEWEED).position = Vector2(randf_range(200, 260), -32)
