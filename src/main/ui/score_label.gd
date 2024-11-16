extends RichTextLabel

@onready var _high_score: = $"../HighScore" as RichTextLabel
func set_score(val: int) -> void:
	text = "SCORE: " + str(val)
	if val > GameStats.high_score:
		GameStats.high_score = val
		_high_score.text = "HIGH SCORE: " + str(GameStats.high_score)
