extends Node3D

@onready var hud = $HUD

func _on_player_raycast_collides(is_colliding):
	hud.set_meta("something_on_scope", is_colliding)
