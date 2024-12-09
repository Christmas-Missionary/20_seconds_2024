extends TileMapLayer
class_name Fort

enum ENEMIES {
	TUMBLEWEED,
	CACTUS,
	FIREBALL_THROWER,
	FIREBALL,
	DUST_DEVIL,
	BOUNCE_PAD,
	DEATH_TRAP,
}

## Adds an enemy to the fort/land. This is used a lot as well as randi().
func _add(enemy: ENEMIES) -> Node2D:
	const ENEMY_SCENES: Array[PackedScene] = [
		preload("res://src/enemies/tumbleweed.tscn"),
		preload("res://src/enemies/cactus.tscn"),
		preload("res://src/enemies/fireball_thrower.tscn"),
		preload("res://src/enemies/fireball.tscn"),
		preload("res://src/enemies/dust_devil.tscn"),
		preload("res://src/enemies/bounce_pad.tscn"),
		preload("res://src/enemies/death_trap.tscn"),
	]
	
	var node: = ENEMY_SCENES[enemy].instantiate() as Node2D
	add_child(node)
	return node

func _set_block(pos: Vector2i, set_to: bool) -> void:
	set_cell(pos, 1 if set_to else -1, Vector2i.ZERO)
