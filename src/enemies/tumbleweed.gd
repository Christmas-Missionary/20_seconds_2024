extends CharacterBody2D
const _SPEED: int = 50

var _is_wall_climbing: bool = false
var _horizontal: Vector2 = Vector2(-_SPEED, 0)
var _last_velocity_y: float = 0.0
var _has_just_started: bool = true

@onready var _audio: = $AudioPlayer as AudioStreamPlayer2D

func _ready() -> void:
	velocity = _horizontal
	set_process_mode(Node.PROCESS_MODE_DISABLED)

func _physics_process(delta: float) -> void:
	const _GRAVITY: float = 300.0
	rotate((TAU / 90) * signf(_horizontal.x))
	if !_is_wall_climbing:
		velocity.y = 0.0 if is_on_floor() else velocity.y + (_GRAVITY * delta)
		if is_on_wall(): # Climb wall
			_is_wall_climbing = true
			velocity = Vector2(0, -_SPEED)
	elif _is_wall_climbing and !is_on_wall(): # Jump off wall, go other way
		_is_wall_climbing = false
		_horizontal = -_horizontal
		velocity = _horizontal
	if is_on_floor() and _last_velocity_y:
		if _has_just_started:
			_has_just_started = false
		else: # Prevents tumbleweed from making noise when it just spawned
			_audio.play()
	_last_velocity_y = velocity.y
	move_and_slide()

func _check_body(body: Node2D) -> void:
	if body is Player:
		(body as Player).die(Player.DEATH_CAUSE.TUMBLEWEED)
