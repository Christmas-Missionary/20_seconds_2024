extends Sprite2D
class_name PlayerDeath

var _x_speed: float = 0.0
var _velocity: Vector2 = Vector2.ZERO
var _rot_speed: float = 0.0

## used to pipeline functionality from init to spawn
func as_sibling(to: Node) -> PlayerDeath:
	to.get_parent().add_child(self)
	return self

func spawn(trans: Transform2D, code: Player.DEATH_CAUSE) -> void:
	const _DEATH_AUDIOS: Array[AudioStreamWAV] = [
		preload("res://assets/sfx/tumbleweed_death.wav"),
		preload("res://assets/sfx/cactus_death.wav"),
		preload("res://assets/sfx/fire_death.wav"),
		preload("res://assets/sfx/falling_death.wav"),
	]
	var _audio: = $DeathPlayer as AudioStreamPlayer2D
	(_audio.stream as AudioStreamRandomizer).set_stream(0, _DEATH_AUDIOS[mini(3, code)])
	_audio.play()
	transform = trans
	_rot_speed = TAU * randf_range(-0.1, 0.1)
	_x_speed = randf_range(-8.0, 8.0)
	_velocity = Vector2(_x_speed, -randf_range(5.0, 10.0))
	# Not all death causes are used, shouldn't be ternary
	match code:
		Player.DEATH_CAUSE.TUMBLEWEED:
			modulate = Color(0.5, 0.25, 0.0)
		Player.DEATH_CAUSE.CACTUS:
			modulate = Color(0.0, 0.5, 0.0)
		Player.DEATH_CAUSE.FIREBALL:
			modulate = Color(1.0, 0.0, 0.0)

func _physics_process(delta: float) -> void:
	_velocity.y += 20 * delta
	position += _velocity
	rotate(_rot_speed)
