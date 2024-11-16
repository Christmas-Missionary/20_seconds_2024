extends RichTextLabel

func _ready() -> void:
	text = "HIGH SCORE: " + str(GameStats.high_score)
