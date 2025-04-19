extends Sprite2D

@export var player_variable_modify: String = ""
@export var player_variable_set: float = 0

@export var power_up_cool_down: float = 2

func _on_hitbox_area_entered(area: Area2D) -> void:
	if area.is_in_group("Player"):
		area.get_parent().set(player_variable_modify, player_variable_set)
		area.get_parent().get_node("Power_up_cool_down").wait_time = power_up_cool_down
		area.get_parent().get_node("Power_up_cool_down").start()
		area.get_parent().power_up_reset.append(name)
		queue_free()
