extends Fort

func _ready() -> void:
	var block_vec: Vector2i = Vector2i(randi_range(3, 11), randi_range(-5, -9))
	_set_block(Vector2i(block_vec), true)
	_add(ENEMIES.BOUNCE_PAD).position = (block_vec * 20.0) + Vector2(10, 0)
	match (randi_range(0, 4)):
		0:
			_add(ENEMIES.CACTUS).position = Vector2(90, -45)
		1:
			_add(ENEMIES.TUMBLEWEED).position = Vector2(270, -32)
			_add(ENEMIES.TUMBLEWEED).position = Vector2(230, -32)
			_add(ENEMIES.TUMBLEWEED).position = Vector2(190, -32)
