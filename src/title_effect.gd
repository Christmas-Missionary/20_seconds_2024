extends RichTextEffect
class_name DesertTextEffect
const bbcode: String = "desert"

func _process_custom_fx(char_fx: CharFXTransform) -> bool:
	char_fx.color.h = (sin(
		char_fx.elapsed_time * 5.0 
		+ (char_fx.range.x / 2.0)) 
		* 0.22
		+ 0.33)
	return true
