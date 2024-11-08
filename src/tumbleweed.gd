extends CharacterBody2D
const _GRAVITY: float = 300.0
const _SPEED: int = 50

var is_wall_climbing: bool = false
var horizontal: Vector2 = Vector2(-_SPEED, 0)

func _ready() -> void:
	velocity = horizontal
	set_process_mode(Node.PROCESS_MODE_DISABLED)

func _physics_process(delta: float) -> void:
	if !is_wall_climbing:
		velocity.y = 0.0 if is_on_floor() else velocity.y + (_GRAVITY * delta)
		if is_on_wall():
			is_wall_climbing = true
			velocity = Vector2(0, -_SPEED)
	elif is_wall_climbing:
		if !is_on_wall():
			is_wall_climbing = false
			horizontal = -horizontal
			velocity = horizontal
	move_and_slide()

func check_body(body: Node2D) -> void:
	if body is Player:
		(body as Player).die()
