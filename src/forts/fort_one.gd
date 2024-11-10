extends Fort

func _ready() -> void:
	_add(ENEMIES.CACTUS).position = (Vector2(90, -86) if randi() % 2 else Vector2(170, -126))
	_add(ENEMIES.TUMBLEWEED).position = (Vector2(150, -30) if randi() % 2 else Vector2(270, -30))
	if !(randi() % 3):
		_add(ENEMIES.CACTUS if randi() % 2 else ENEMIES.BOUNCE_PAD).position = Vector2(50, -62)
