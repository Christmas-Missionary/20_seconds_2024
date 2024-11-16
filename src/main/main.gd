extends Node2D

const _ALL_FORTS: Array[PackedScene] = [
	preload("res://src/forts/fort_one.tscn"),
	preload("res://src/forts/fort_two.tscn"),
	preload("res://src/forts/fort_three.tscn"),
]
const size: int = 3

signal request_pause

func _ready() -> void:
	var fort: = _ALL_FORTS[randi() % size].instantiate() as Node2D
	add_child(fort)
	fort.position = Vector2(500, 0)
	
	var tilelayer: = $BlockLayer as TileMapLayer
	for i: int in range(2, 526): # 20 seconds of just running
		tilelayer.set_cell(Vector2(i, -1), 1, Vector2i.ZERO)
	get_tree().set_pause(true)

func _unhandled_key_input(event: InputEvent) -> void:
	if event.is_action_pressed(&"Pause"):
		request_pause.emit()
		get_tree().set_pause(true)

@onready var _notifier: = $Notifier as VisibleOnScreenNotifier2D
func _generate_next_fort() -> void:
	var fort: = _ALL_FORTS[randi() % size].instantiate() as Node2D
	add_child(fort)
	fort.position = _notifier.position + Vector2(-150, 150)
	_notifier.position.x += 500
