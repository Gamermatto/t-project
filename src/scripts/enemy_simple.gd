extends "res://src/scripts/enemy_core.gd"

func _process(delta: float) -> void:
	super(delta)
	basic_movement_towards_player(delta)
