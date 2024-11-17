extends Resource
class_name SaveGame

@export var music_volume: float
@export var sfx_volume: float
@export var is_respawning_automatically: bool
@export var high_score: int

func save(music_vol: float, sfx_vol: float, auto_respawn: bool, high_score_: int) -> SaveGame:
	music_volume = music_vol
	sfx_volume = sfx_vol
	is_respawning_automatically = auto_respawn
	high_score = high_score_
	return self

func to(save_path: String) -> void:
	ResourceSaver.save(self, save_path)
