extends Button

func _ready() -> void:
	pressed.connect(get_tree().set_pause.bind(false))
