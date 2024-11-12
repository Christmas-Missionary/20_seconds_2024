extends RichTextLabel

@onready var _high_score: = $"../HighScoreLabel" as RichTextLabel
func set_score(val: int) -> void:
	text = "SCORE: " + str(val)
	if val > HighScore.high_score:
		HighScore.high_score = val
		_high_score.text = "HIGH SCORE: " + str(HighScore.high_score)
