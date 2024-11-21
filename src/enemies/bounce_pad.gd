extends RigidBody2D

@onready var _audio: = $AudioPlayer as AudioStreamPlayer2D

func _bounce_thing(body: Node) -> void:
	const _FLING_VEL: float = -400
	if body == self:
		return
	if body is RigidBody2D:
		_audio.play()
		var rigid: = body as RigidBody2D
		rigid.linear_velocity.y = _FLING_VEL if (rigid.position.y <= position.y) else -_FLING_VEL
	elif body is CharacterBody2D:
		_audio.play()
		var chara: = body as CharacterBody2D
		chara.velocity.y = _FLING_VEL if (chara.position.y <= position.y) else -_FLING_VEL
		chara.move_and_slide()
		if body is Player:
			(body as Player).num_of_jumps = 0
