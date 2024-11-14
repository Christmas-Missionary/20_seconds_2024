extends Node2D

const _ALL_FORTS: Array[PackedScene] = [
	preload("res://src/forts/fort_one.tscn"),
	preload("res://src/forts/fort_two.tscn"),
	preload("res://src/forts/fort_three.tscn"),
]
const size: int = 3

signal request_pause

func _new_cloud_sprite() -> CompressedTexture2D:
	var val: float = randf()
	return (preload("res://assets/images/cloud1.png") if val < 0.45 else 
			preload("res://assets/images/cloud2.png") if val < 0.98 else 
			preload("res://assets/images/cloud3.png"))

func _ready() -> void:
	var fort: = _ALL_FORTS[randi() % size].instantiate() as Node2D
	add_child(fort)
	fort.position = Vector2(500, 0)
	
	var tilelayer: = $BlockLayer as TileMapLayer
	for i: int in range(2, 526): # 20 seconds of just running
		tilelayer.set_cell(Vector2(i, -1), 1, Vector2i.ZERO)
	get_tree().set_pause(true)
	
	var x_pos: int = 0
	while (x_pos < 10520):
		x_pos += randf_range(200, 400)
		var sprite: = Sprite2D.new()
		add_child(sprite)
		sprite.texture = _new_cloud_sprite()
		sprite.position = Vector2(x_pos, randf_range(-240, -280))

func _unhandled_key_input(event: InputEvent) -> void:
	if event.is_action_pressed(&"Pause"):
		request_pause.emit()
		get_tree().set_pause(true)

@onready var _notifier: = $Notifier as VisibleOnScreenNotifier2D
func _generate_next_fort() -> void:
	var start: int = Time.get_ticks_usec()
	
	var fort: = _ALL_FORTS[randi() % size].instantiate() as Node2D
	add_child(fort)
	fort.position = _notifier.position + Vector2(-150, 150)
	_notifier.position.x += 500
	
	print(Time.get_ticks_usec() - start)
