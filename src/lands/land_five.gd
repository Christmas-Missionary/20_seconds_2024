extends Fort

func _ready() -> void:
	for i in range(13, randi_range(2, 12), -1):
		var curpos: Vector2i = Vector2i(i, -2)
		while (curpos.x < 14):
			_set_block(curpos, true)
			curpos += Vector2i(1, -1)
	
	if !(randi() % 4):
		_add(ENEMIES.TUMBLEWEED).position = Vector2(240, -248)
