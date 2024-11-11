extends RichTextLabel

@onready var _high_score: = $"../HighScoreLabel" as RichTextLabel
func set_score(val: int) -> void:
	text = "Score: " + str(val)
	if val > HighScore.high_score:
		HighScore.high_score = val
		_high_score.text = "High Score: " + str(HighScore.high_score)
