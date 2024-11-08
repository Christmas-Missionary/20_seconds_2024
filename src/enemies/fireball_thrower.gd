extends RigidBody2D

const _FIREBALL: PackedScene = preload("res://src/enemies/fireball.tscn")
const _RAD_DIFF: float = PI / 4 * 3

@onready var timer: = $Timer as Timer

func _emit_fireball() -> void:
	timer.start(randf_range(0.7, 1.3))
	var ball: = _FIREBALL.instantiate() as Fireball
	add_child(ball)
	ball.spawn(Vector2.UP.rotated(randf_range(-_RAD_DIFF, _RAD_DIFF)))
