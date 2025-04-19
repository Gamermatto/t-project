extends Control

func _ready() -> void:
	MainMenuMusic.play_music_level()

func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://src/scenes/arena.tscn")
	MainMenuMusic.stop()


func _on_options_pressed() -> void:
	get_tree().change_scene_to_file("res://src/scenes/MainMenu/options_menu.tscn")


func _on_exit_pressed() -> void:
	get_tree().quit()
