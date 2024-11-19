extends Sprite2D
class_name PlayerDeath

var _x_speed: float = 0.0
var _velocity: Vector2 = Vector2.ZERO
var _rot_speed: float = 0.0

func spawn(trans: Transform2D) -> void:
	transform = trans
	_rot_speed = TAU * randf_range(-0.1, 0.1)
	_x_speed = randf_range(-8.0, 8.0)
	_velocity = Vector2(_x_speed, -randf_range(5.0, 10.0))

func _physics_process(delta: float) -> void:
	_velocity.y += 20 * delta
	position += _velocity
	rotate(_rot_speed)