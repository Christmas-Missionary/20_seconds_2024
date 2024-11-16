extends CheckButton

func _ready() -> void:
	button_pressed = GameStats.is_respawning_automatically

func _on_pressed() -> void:
	GameStats.is_respawning_automatically = button_pressed
