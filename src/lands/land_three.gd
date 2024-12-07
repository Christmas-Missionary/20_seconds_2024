extends Fort

func _ready() -> void:
	_add(ENEMIES.BOUNCE_PAD).position = Vector2(29 + (20 * randi_range(0, 5)), -123)
	
	if (randi() % 2):
		var row: int = randi_range(-6, -2)
		for i in range(2, 13):
			_set_block(Vector2i(i, row), false)
