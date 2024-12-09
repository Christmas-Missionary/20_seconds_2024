extends RigidBody2D

@onready var _audio: = $AudioPlayer as AudioStreamPlayer2D

var _has_just_started: bool = true

func _bounce_thing(body: Node) -> void:
	const _FLING_VEL: float = -400 # Up is negative y
	if body == self:
		return
	if body is RigidBody2D: # Cactus, Tumbleweed, bounce pad, fireball thrower
		if !_has_just_started:
			_audio.play()
		_has_just_started = false
		var rigid: = body as RigidBody2D
		rigid.linear_velocity.y = _FLING_VEL if (rigid.position.y <= position.y) else -_FLING_VEL
	elif body is CharacterBody2D:
		_has_just_started = false
		_audio.play()
		var chara: = body as CharacterBody2D
		if body is Player:
			(body as Player).num_of_jumps = 0
			chara.velocity.y = _FLING_VEL
		else:
			chara.velocity.y = _FLING_VEL if (chara.position.y <= position.y) else -_FLING_VEL
		chara.move_and_slide()
