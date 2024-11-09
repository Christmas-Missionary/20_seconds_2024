extends RigidBody2D

func _check_body(body: Node2D) -> void:
	if body is Player:
		(body as Player).die()
