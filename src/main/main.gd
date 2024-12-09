extends Node2D

var is_reloading: bool = false

@onready var _notifier: = $Notifier as VisibleOnScreenNotifier2D

signal request_pause

static func _new_fort() -> Node2D:
	const _ALL_FORTS: Array[PackedScene] = [
		preload("res://src/forts/fort_one.tscn"),
		preload("res://src/forts/fort_two.tscn"),
		preload("res://src/forts/fort_three.tscn"),
		preload("res://src/forts/fort_four.tscn"),
		preload("res://src/forts/fort_five.tscn"),
		preload("res://src/forts/fort_six.tscn"),
		preload("res://src/forts/fort_seven.tscn"),
		preload("res://src/forts/fort_eight.tscn"),
		preload("res://src/forts/fort_nine.tscn"),
	]
	const _ALL_LANDS: Array[PackedScene] = [
		preload("res://src/lands/land_one.tscn"),
		preload("res://src/lands/land_two.tscn"),
		preload("res://src/lands/land_three.tscn"),
		preload("res://src/lands/land_four.tscn"),
		preload("res://src/lands/land_five.tscn"),
		preload("res://src/lands/land_six.tscn"),
		preload("res://src/lands/land_seven.tscn"),
		preload("res://src/lands/land_eight.tscn"),
	]
	if !(randi() % 200):
		return preload("res://src/forts/hell.tscn").instantiate() as Node2D
	if (randi() % 8):
		return _ALL_LANDS[randi() % 8].instantiate() as Node2D
	return _ALL_FORTS[((randi() % 8) if (randi() % 30) else 8)].instantiate() as Node2D

func _ready() -> void:
	if MusicPlayer.stream_paused:
		MusicPlayer.set_stream_paused(false)
	
	var fort: Node2D = _new_fort()
	add_child(fort)
	fort.position = Vector2(500, 0)
	
	# Sets up floor
	var tilelayer: = $BlockLayer as TileMapLayer
	for i: int in range(2, 526): # 20 seconds of just running
		tilelayer.set_cell(Vector2(i, -1), 1, Vector2i.ZERO)
	
	# Start Screen
	if GameStats.is_first_time:
		GameStats.is_first_time = false
		request_pause.emit()
		get_tree().set_pause(true)

func _unhandled_key_input(event: InputEvent) -> void:
	if event.is_action_pressed(&"Restart"):
		GameStats.last_score = floori(($Player as Node2D).position.x / 20)
		get_tree().reload_current_scene.call_deferred()
		is_reloading = true
	elif event.is_action_pressed(&"Pause") and !is_reloading:
		request_pause.emit()
		get_tree().set_pause(true)

func _generate_next_fort() -> void:
	var fort: Node2D = _new_fort()
	add_child(fort)
	fort.position = _notifier.position + Vector2(-150, 150)
	_notifier.position.x += 500
