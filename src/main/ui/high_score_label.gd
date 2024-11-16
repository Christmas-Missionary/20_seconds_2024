extends RichTextLabel

func _ready() -> void:
	text = "HIGH SCORE: " + str(HighScore.high_score)
