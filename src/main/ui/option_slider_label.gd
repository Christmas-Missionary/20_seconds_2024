extends RichTextLabel

@export var binded_text: String

func _change_text(val: float) -> void:
	text = binded_text + str(int(val))
