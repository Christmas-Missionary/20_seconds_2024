extends TileMapLayer
class_name Fort

enum ENEMIES {
	TUMBLEWEED,
	CACTUS,
	FIREBALL_THROWER,
	FIREBALL,
	DUST_DEVIL,
	BOUNCE_PAD,
}

func _add(enemy: ENEMIES) -> Node2D:
	const ENEMY_SCENES: Array[PackedScene] = [
		preload("res://src/enemies/tumbleweed.tscn"),
		preload("res://src/enemies/cactus.tscn"),
		preload("res://src/enemies/fireball_thrower.tscn"),
		preload("res://src/enemies/fireball.tscn"),
		preload("res://src/enemies/dust_devil.tscn"),
		preload("res://src/enemies/bounce_pad.tscn"),
	]
	
	var node: = ENEMY_SCENES[enemy].instantiate() as Node2D
	add_child(node)
	return node
