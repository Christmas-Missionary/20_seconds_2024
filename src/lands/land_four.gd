extends Fort

func _ready() -> void:
	const positions: PackedInt32Array = [
		30, 110, 190, 230,
	]
	for i in positions:
		if !(randi() % 3):
			_add(ENEMIES.TUMBLEWEED).position = Vector2i(i, -32)
	_add(ENEMIES.BOUNCE_PAD).position = Vector2(randf_range(130, 170), -143)
	
