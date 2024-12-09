extends Node2D

@onready var _player: = $"/root/Main/Player" as Node2D

func _physics_process(delta: float) -> void:
	position += Vector2(-60, 0) * delta
	
	# Pull player towards dust devil
	_player.position.x += 60.0 * signf(global_position.x - _player.position.x) * delta
