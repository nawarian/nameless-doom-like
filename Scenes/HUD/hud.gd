extends Control

@onready var crosshair = $CrossHair

func _process(delta):
	if get_meta("something_on_scope", false):
		crosshair.modulate = Color.CHARTREUSE
	else:
		crosshair.modulate = Color.WHITE
