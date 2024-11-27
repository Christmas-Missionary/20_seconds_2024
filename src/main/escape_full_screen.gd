extends Node

func _unhandled_key_input(event: InputEvent) -> void:
	if event.is_action_pressed(&"Escape"):
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
