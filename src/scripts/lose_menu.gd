extends Control


func _on_retry_pressed() -> void:
	get_tree().change_scene_to_file("res://src/scenes/arena.tscn")
	
func _on_pressed() -> void:
	get_tree().change_scene_to_file("res://src/scenes/MainMenu/menu.tscn")
