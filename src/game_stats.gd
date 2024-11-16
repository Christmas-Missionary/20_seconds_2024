## Everything that persists when main scene is reloaded
extends Node
# Singleton: GameStats

var music_volume: int = 50
var sfx_volume: int = 50
var is_respawning_automatically: bool = false

var high_score: int = 0
