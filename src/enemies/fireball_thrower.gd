extends RigidBody2D

const _FIREBALL: PackedScene = preload("res://src/enemies/fireball.tscn")
const _FIRST_SPRITE: CompressedTexture2D = preload("res://assets/images/fire_thrower1.png")
const _OTHER_SPRITE: CompressedTexture2D = preload("res://assets/images/fire_thrower2.png")

@onready var _rest_timer: = $RestTimer as Timer
@onready var _fire_timer: = $FireTimer as Timer
@onready var _sprite: = $Sprite as Sprite2D

func _emit_fireball() -> void:
	_sprite.texture = _OTHER_SPRITE
	_fire_timer.start(0.5)
	await _fire_timer.timeout
	_rest_timer.start(randf_range(0.3, 0.9))
	var ball: = _FIREBALL.instantiate() as Fireball
	add_sibling(ball)
	ball.spawn(position, Vector2.UP.rotated(randf_range(0, TAU)))
	_sprite.texture = _FIRST_SPRITE
