extends RichTextLabel

func _ready() -> void:
	($"../Music" as HSlider).value = GameStats.music_volume
	text = "[center]Music Volume - " + str(GameStats.music_volume)

func _change_text(val: float) -> void:
	text = "[center]Music Volume - " + str(val)
	GameStats.music_volume = val
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index(MusicPlayer.BUS_NAME), linear_to_db(val))
