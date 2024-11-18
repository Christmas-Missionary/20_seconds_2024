extends Area2D
class_name Fireball

var _velocity: Vector2 = Vector2.ZERO
var _rotation_speed: float = 0.0

func spawn(pos: Vector2, direction: Vector2) -> void:
	position = pos
	_velocity = direction * 5
	_rotation_speed = randf_range(-0.5, 0.5)

func _physics_process(delta: float) -> void:
	_velocity.y += (5 * delta)
	position += _velocity
	rotate(_rotation_speed)

func _check_body(body: Node2D) -> void:
	if body is Player:
		(body as Player).die(Player.DEATH_CAUSE.FIREBALL)
