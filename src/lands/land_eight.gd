extends Fort

func _ready() -> void:
	if !(randi() % 3):
		_add(ENEMIES.BOUNCE_PAD).position = Vector2(50, -43)
	if !(randi() % 3):
		_add(ENEMIES.CACTUS).position = Vector2(50, -72)
	if !(randi() % 3):
		_add(ENEMIES.BOUNCE_PAD).position = Vector2(130, -103)
	if !(randi() % 3):
		_add(ENEMIES.CACTUS).position = Vector2(130, -132)
	if !(randi() % 3):
		_add(ENEMIES.BOUNCE_PAD).position = Vector2(210, -43)
	if !(randi() % 3):
		_add(ENEMIES.CACTUS).position = Vector2(210, -72)
