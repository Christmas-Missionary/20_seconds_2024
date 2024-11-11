extends RigidBody2D

const _FIREBALL: PackedScene = preload("res://src/enemies/fireball.tscn")

@onready var timer: = $Timer as Timer

func _emit_fireball() -> void:
	timer.start(randf_range(0.7, 1.3))
	var ball: = _FIREBALL.instantiate() as Fireball
	add_sibling(ball)
	ball.spawn(position, Vector2.UP.rotated(randf_range(0, TAU)))
