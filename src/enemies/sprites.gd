extends Sprite2D

@export var sprites: Array[CompressedTexture2D]

func _ready() -> void:
	texture = sprites[randi() % sprites.size()]
