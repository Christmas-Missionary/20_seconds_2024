extends TileMapLayer

func _ready() -> void:
	var cactus: = Enemies.CACTUS.instantiate() as Node2D
	add_child(cactus)
	cactus.position = (Vector2(90, -86) if randi() % 2 else Vector2(170, -126))
	var tumble: = Enemies.TUMBLEWEED.instantiate() as Node2D
	add_child(tumble)
	tumble.position = (Vector2(150, -30) if randi() % 2 else Vector2(270, -30))
	if !(randi() % 3):
		var thing: = (Enemies.CACTUS if randi() % 2 else Enemies.BOUNCE_PAD).instantiate() as Node2D
		add_child(thing)
		thing.position = Vector2(50, -62)
