extends Node

var node_creation_parent = null
var player = null
var camera = null

var points = 0
var highscore = 0

func instance_node(node, location, parent):
	var node_instance = node.instantiate()
	parent.add_child(node_instance)
	node_instance.global_position = location
	return node_instance

func save():
	var save_dict = {
		"highscore": highscore
	}
	return save_dict

func save_game():
	var file = FileAccess.open_encrypted_with_pass("user://savegame.save", FileAccess.WRITE, "B845Ni")
	if file:
		var json_string = JSON.stringify(save())
		file.store_line(json_string)
		print(ProjectSettings.globalize_path("user://"))
		file.close()

func load_game():
	var file = FileAccess.open_encrypted_with_pass("user://savegame.save", FileAccess.READ, "B845Ni")
	if not file:
		print("Error! We don't have a save file to load")
		return
	
	var current_line = file.get_line()
	var json = JSON.new()
	var parse_result = json.parse(current_line)
	
	if parse_result == OK:
		highscore = json.get_data()["highscore"]
	else:
		print("Error parsing JSON: ", parse_result)
	
	file.close()
