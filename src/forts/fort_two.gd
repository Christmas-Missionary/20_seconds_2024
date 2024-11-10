extends TileMapLayer

func _ready() -> void:
	var tumble: = Enemies.TUMBLEWEED.instantiate() as Node2D
	add_child(tumble)
	tumble.position = Vector2(randf_range(190, 230), -30)
	var thing: = (Enemies.TUMBLEWEED if randi() % 2 else Enemies.BOUNCE_PAD).instantiate() as Node2D
	add_child(thing)
	thing.position = Vector2(randf_range(130, 190), -143)
	if (randi() % 2):
		set_cell(Vector2i(8, -6), -1, Vector2i.ZERO)
		var thrower: = Enemies.FIREBALL_THROWER.instantiate() as Node2D
		add_child(thrower)
		thrower.position = Vector2(170, -110)
	
	var code: int = randi() % 3
	if (code >= 1):
		var cactus: = Enemies.CACTUS.instantiate() as Node2D
		add_child(cactus)
		cactus.position = Vector2(250, -46)
	if (code == 2):
		var cactus: = Enemies.CACTUS.instantiate() as Node2D
		add_child(cactus)
		cactus.position = Vector2(250, -96)
