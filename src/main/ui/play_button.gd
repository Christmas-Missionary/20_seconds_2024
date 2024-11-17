extends Button

func _ready() -> void:
	pressed.connect(get_tree().set_pause.bind(false))
	if GameStats.is_respawning_automatically:
		pressed.emit()
	else:
		get_tree().set_pause(true)
