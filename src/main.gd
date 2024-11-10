extends Node2D

const _ALL_FORTS: Array[PackedScene] = [
	preload("res://src/forts/fort_one.tscn"),
	preload("res://src/forts/fort_two.tscn"),
	preload("res://src/forts/fort_three.tscn"),
]
const size: int = 3

func _ready() -> void:
	for dist: int in range(500, 10501, 500):
		var fort: = _ALL_FORTS[randi() % size].instantiate() as Node2D
		add_child(fort)
		fort.position = Vector2(dist, 0)
	
	var tilelayer: = $BlockLayer as TileMapLayer
	for i: int in range(2, 526): # 20 seconds of just running
		tilelayer.set_cell(Vector2(i, -1), 1, Vector2i.ZERO)
