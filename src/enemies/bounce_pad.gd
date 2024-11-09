extends Area2D

func _bounce_thing(body: Node) -> void:
	const fling_vel: Vector2 = Vector2(0, -500)
	if body is RigidBody2D:
		(body as RigidBody2D).linear_velocity += fling_vel
	elif body is CharacterBody2D:
		(body as CharacterBody2D).velocity += fling_vel
		(body as CharacterBody2D).move_and_slide()
