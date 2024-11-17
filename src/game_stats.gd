## Everything that persists when main scene is reloaded
extends Node
# Singleton: GameStats

var music_volume: float = 0.5
var sfx_volume: float = 0.5
var is_respawning_automatically: bool = false

var high_score: int = 0
