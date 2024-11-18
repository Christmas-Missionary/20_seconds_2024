extends RichTextLabel

func _ready() -> void:
	text = "LAST SCORE: " + str(GameStats.last_score)
