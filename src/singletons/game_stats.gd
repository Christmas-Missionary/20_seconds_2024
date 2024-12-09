## Everything that persists when main scene is reloaded
extends Node
# Singleton: GameStats

const _SAVE_PATH: String = "user://20_seconds_2024.tres"

var music_volume: float = 0.5
var sfx_volume: float = 0.5
var is_respawning_automatically: bool = false
var high_score: int = 0
var last_score: int = 0

var is_first_time: bool = true

func _init() -> void:
	set_process_mode(Node.PROCESS_MODE_ALWAYS)
	if ResourceLoader.exists(_SAVE_PATH) and ResourceLoader.load(_SAVE_PATH) != null:
		var save_game: = ResourceLoader.load(_SAVE_PATH) as SaveGame
		if save_game != null:
			music_volume = save_game.music_volume
			sfx_volume = save_game.sfx_volume
			is_respawning_automatically = save_game.is_respawning_automatically
			high_score = save_game.high_score
			last_score = save_game.last_score

func _notification(arg: int) -> void:
	if arg == NOTIFICATION_WM_MOUSE_EXIT or arg == NOTIFICATION_WM_CLOSE_REQUEST: # If you left the window or close via red button, or Control/Command+Q
		(SaveGame.new()
				 .save(music_volume, sfx_volume, is_respawning_automatically, high_score, ($/root/Main/Player as Player).get_score())
				 .to(_SAVE_PATH))
	if arg == NOTIFICATION_WM_CLOSE_REQUEST:
		get_tree().quit()
