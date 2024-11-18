extends Fort

func _ready() -> void:
	var platform_alt: int = -randi_range(6, 11)
	for i in range(7, 15):
		set_cell(Vector2i(i, platform_alt), 1, Vector2i.ZERO)
	($Cactus as Node2D).position = Vector2(randf_range(110, 211), -46)
