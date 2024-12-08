extends Sprite2D

func _ready() -> void:
	if GameStats.last_score >= 50 and !(randi() % 5):
		texture = preload("res://assets/images/secret_sign.png")
