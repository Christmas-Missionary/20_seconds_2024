extends Area2D

func _bounce_thing(body: Node) -> void:
	if body is RigidBody2D:
		(body as RigidBody2D).linear_velocity = Vector2(0, -500)
