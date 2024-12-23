extends RichTextLabel

func _ready() -> void:
	($"../SFX" as HSlider).value = GameStats.sfx_volume
	text = "[center]SFX Volume - " + str(GameStats.sfx_volume)

func _change_text(val: float) -> void:
	text = "[center]SFX Volume - " + str(val)
	GameStats.sfx_volume = val
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index(&"SFX"), linear_to_db(val))
