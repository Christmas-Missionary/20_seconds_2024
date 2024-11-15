extends Node2D

func _ready() -> void:
	var x_pos: int = 0
	while (x_pos < 10520):
		x_pos += randi_range(200, 400)
		var sprite: = Sprite2D.new()
		add_child(sprite)
		var val: float = randf()
		sprite.texture = (
			preload("res://assets/images/cloud1.png") if val < 0.45 else 
			preload("res://assets/images/cloud2.png") if val < 0.98 else 
			preload("res://assets/images/cloud3.png"))
		sprite.position = Vector2(x_pos, randf_range(-240, -280))
