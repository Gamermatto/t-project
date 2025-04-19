extends Node2D

var fade: bool = false
var alpha: float = 1.0

func _process(delta: float) -> void:
	if fade:
		alpha = lerp(alpha, 0.0, 0.1)
		modulate.a = alpha

		if alpha < 0.005:
			queue_free()

func _on_fade_out_time_timeout() -> void:
	fade = true
