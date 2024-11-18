extends Fort

func _ready() -> void:
	var platform_alt: int = -randi_range(6, 11)
	for i in range(7, 15):
		_set_block(Vector2i(i, platform_alt), true)
	($Cactus as Node2D).position = Vector2(randf_range(110, 211), -46)
