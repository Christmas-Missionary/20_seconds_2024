extends RichTextLabel

@onready var _slider: = $"../Music" as HSlider

func _ready() -> void:
	_slider.value = GameStats.music_volume
	text = "[center]Music Volume - " + str(GameStats.music_volume)

func _change_text(val: float) -> void:
	text = "[center]Music Volume - " + str(int(val))
	GameStats.music_volume = int(val)
