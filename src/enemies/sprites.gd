extends Sprite2D

@export var sprites: Array[CompressedTexture2D]

func _ready() -> void:
	# `pick_random()` returns a variant, big no-no
	texture = sprites[randi() % sprites.size()]
