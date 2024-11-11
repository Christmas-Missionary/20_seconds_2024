extends RichTextLabel

@onready var timer: = $GameTimer as Timer
func _physics_process(_delta) -> void:
	text = "Time: " + str(timer.time_left).substr(0, 4)
