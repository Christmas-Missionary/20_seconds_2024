extends Area2D

func _bounce_thing(body: Node) -> void:
	const fling_vel: float = -400
	if body is RigidBody2D:
		(body as RigidBody2D).linear_velocity.y = fling_vel
	elif body is CharacterBody2D:
		(body as CharacterBody2D).velocity.y = fling_vel
		(body as CharacterBody2D).move_and_slide()
