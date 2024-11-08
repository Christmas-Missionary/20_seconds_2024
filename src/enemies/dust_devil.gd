extends Area2D

func _check_body(body: Node2D) -> void:
	if body is Player:
		(body as Player).velocity = Vector2(-2000, -1000)

func _physics_process(delta: float) -> void:
	position += Vector2(-60, 0) * delta
