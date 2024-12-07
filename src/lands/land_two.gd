extends Fort

func _ready() -> void:
	var column: int = randi_range(0, 14)
	for i: int in range(-2, randi_range(-2, -6), -1):
		_set_block(Vector2i(column, i), true)
	_add(ENEMIES.CACTUS).position = Vector2(column * 20 + 50, -45)
	
	if (randi() % 5):
		_add(ENEMIES.BOUNCE_PAD).position = Vector2(column * 20 + 10, -100)
