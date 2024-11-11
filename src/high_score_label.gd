extends RichTextLabel

func _ready() -> void:
	text = "High Score: " + str(HighScore.high_score)
