extends CharacterBody2D
const _GRAVITY: float = 300.0
const _SPEED: int = 50

func _ready() -> void:
	velocity = Vector2.LEFT * _SPEED
	set_process_mode(Node.PROCESS_MODE_DISABLED)

func _physics_process(delta: float) -> void:
	if is_on_wall():
		velocity.x = get_wall_normal().x * _SPEED
	velocity.y = 0.0 if is_on_floor() else velocity.y + (_GRAVITY * delta)
	move_and_slide()
