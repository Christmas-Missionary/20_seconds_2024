extends Fort

func _ready() -> void:
	var cell_pos: Vector2i = Vector2i(randi_range(5, 7), randi_range(-14, -12))
	for i in 6:
		_set_block(cell_pos, true)
		cell_pos.y += 1
	if !(randi() % 25):
		_add(ENEMIES.DEATH_TRAP).position = Vector2(300, 0)
	if !(randi() % 9):
		_add(ENEMIES.TUMBLEWEED).position = Vector2(randf_range(155, 165), -82)
	
