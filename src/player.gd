extends CharacterBody2D
class_name Player

const _MAX_SPEED: float = 520.0
const _ACCEL: float = 1500.0
const _FRICTION: float = 1500.0
const GRAVITY: float = 880.0
const _JUMP_FORCE: float = 370.0
const _QUEUE_THESHOLD: float = 0.15

enum _JUMP_STATES {NONE, QUEUE, READY}

var _num_of_jumps: int = 0

var jump_status: _JUMP_STATES = _JUMP_STATES.NONE:
	set(js):
		jump_status = js
		if jump_status == _JUMP_STATES.READY:
			_num_of_jumps = 0
			js = _JUMP_STATES.NONE
		set_process(js)
		if !js:
			time_since_jump_press = 0.0

func _ready() -> void:
	set_process(false)

func _physics_process(delta: float):
	var input_axis: float = Input.get_action_strength(&"Right") - Input.get_action_strength(&"Left")
	velocity = Vector2(move_toward(velocity.x, input_axis * _MAX_SPEED,
	(_ACCEL if input_axis else _FRICTION) * delta),
	0.0 if is_on_floor() else velocity.y + (GRAVITY * delta))
	if jump_status == _JUMP_STATES.READY:
		velocity.y = -_JUMP_FORCE
		_num_of_jumps += 1
		jump_status = _JUMP_STATES.NONE
	elif Input.is_action_just_pressed(&"Jump"):
		if _num_of_jumps < 2:
			velocity.y = -_JUMP_FORCE
			_num_of_jumps += 1
		else:
			jump_status = _JUMP_STATES.QUEUE
	elif is_on_floor():
		_num_of_jumps = 0
	move_and_slide()
	# Placeholder for death
	if position.y > 0:
		position = Vector2(50, -50)

var time_since_jump_press: float = 0.0
func _process(delta: float) -> void:
	time_since_jump_press += delta
	if is_on_floor():
		jump_status = _JUMP_STATES.READY
	elif time_since_jump_press >= _QUEUE_THESHOLD:
		jump_status = _JUMP_STATES.NONE

## Called by tumbleweed
func die() -> void:
	# Placeholder
	print("the player has died.")
