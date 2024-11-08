extends Area2D
class_name Fireball

var _velocity: Vector2 = Vector2.ZERO

func spawn(direction: Vector2) -> void:
	_velocity = direction * 5

func _physics_process(delta: float) -> void:
	_velocity.y += (5 * delta)
	position += _velocity

func _check_body(body: Node2D) -> void:
	if body is Player:
		(body as Player).die()
