extends CharacterBody2D
class_name Player

enum _JUMP_STATES {NONE, QUEUE, READY}

var _num_of_jumps: int = 0

var _jump_status: _JUMP_STATES = _JUMP_STATES.NONE:
	set(js):
		_jump_status = js
		if _jump_status == _JUMP_STATES.READY:
			_num_of_jumps = 0
			js = _JUMP_STATES.NONE
		set_process(js)
		if !js:
			time_since_jump_press = 0.0

@onready var _camera: = $Camera as Camera2D
@onready var _jump_player: = $JumpPlayer as AudioStreamPlayer2D

signal block_distance(val: int)

func _ready() -> void:
	set_process(false)

func _jump() -> void:
	const _JUMP_FORCE: float = 370.0
	velocity.y = -_JUMP_FORCE
	_num_of_jumps += 1
	_jump_player.play()

func _physics_process(delta: float):
	const _MAX_SPEED: float = 520.0
	const _ACCEL: float = 1500.0
	const _FRICTION: float = 2200.0
	const _GRAVITY: float = 880.0
	var input_axis: float = Input.get_action_strength(&"Right") - Input.get_action_strength(&"Left")
	velocity = Vector2(move_toward(velocity.x, input_axis * _MAX_SPEED,
	(_ACCEL if input_axis else _FRICTION) * delta),
	0.0 if is_on_floor() else velocity.y + (_GRAVITY * delta))
	if _jump_status == _JUMP_STATES.READY:
		_jump()
		_jump_status = _JUMP_STATES.NONE
	elif Input.is_action_just_pressed(&"Jump"):
		if _num_of_jumps < 2:
			_jump()
		else:
			_jump_status = _JUMP_STATES.QUEUE
	elif is_on_floor():
		_num_of_jumps = 0
	move_and_slide()
	
	const _VIEWPORT_QUARTER_WIDTH: int = 300
	_camera.limit_left = maxi(_camera.limit_left, int(_camera.get_screen_center_position().x - _VIEWPORT_QUARTER_WIDTH))
	position.x = maxi(int(position.x), _camera.limit_left)
	
	block_distance.emit(floori(position.x / 20))
	if position.y > 0:
		die()

var time_since_jump_press: float = 0.0
func _process(delta: float) -> void:
	const _QUEUE_THESHOLD: float = 0.15
	time_since_jump_press += delta
	if is_on_floor():
		_jump_status = _JUMP_STATES.READY
	elif time_since_jump_press >= _QUEUE_THESHOLD:
		_jump_status = _JUMP_STATES.NONE

func die() -> void:
	GameStats.last_score = floori(position.x / 20)
	get_tree().reload_current_scene.call_deferred()
