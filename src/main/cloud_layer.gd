extends Node2D

func _ready() -> void:
	var x_pos: int = 0
	while (x_pos < 10520):
		x_pos += randi_range(200, 400)
		var sprite: = Sprite2D.new()
		add_child(sprite)
		var val: float = randf()
		sprite.texture = (
			preload("res://assets/images/background/cloud1.png") if val < 0.45 else 
			preload("res://assets/images/background/cloud2.png") if val < 0.98 else 
			preload("res://assets/images/background/cloud3.png"))
		sprite.position = Vector2(x_pos, randf_range(-240, -280))
		sprite.rotation = randf_range(0, TAU)
		sprite.scale = Vector2.ONE * (randf_range(1.0, 2.5) if randi() % 25 else (randf_range(7.0, 9.0)))
