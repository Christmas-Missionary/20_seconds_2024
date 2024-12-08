extends Sprite2D

func _ready() -> void:
	if GameStats.last_score >= 50 and !(randi() % 5):
		texture = preload("res://assets/images/secret_sign.png")
	else:
		set_physics_process(false)


var _rate: float = -0.01
func _physics_process(_delta) -> void:
	modulate.g += _rate
	if modulate.g <= 0.0 or modulate.g >= 1.0:
		_rate = -_rate
