extends RichTextLabel

@onready var _timer: = $GameTimer as Timer

func _physics_process(_delta) -> void:
	text = "TIME: " + str(_timer.time_left).substr(0, 4)
