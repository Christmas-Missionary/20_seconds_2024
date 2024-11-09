extends RigidBody2D

func _bounce_thing(body: Node) -> void:
	const fling_vel: float = -400
	if body == self:
		return
	if body is RigidBody2D:
		var rigid: = body as RigidBody2D
		rigid.linear_velocity.y = fling_vel if (rigid.position.y <= position.y) else -fling_vel
	elif body is CharacterBody2D:
		var chara: = body as CharacterBody2D
		chara.velocity.y = fling_vel if (chara.position.y <= position.y) else -fling_vel
		chara.move_and_slide()
