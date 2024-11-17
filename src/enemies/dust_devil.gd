extends Node2D

@onready var _player: = $"/root/Main/Player" as Node2D

func _physics_process(delta: float) -> void:
	position += Vector2(-60, 0) * delta
	_player.position.x += (60.0 if _player.position.x > position.x else -60.0) * delta
