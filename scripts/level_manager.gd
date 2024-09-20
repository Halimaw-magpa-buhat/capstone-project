extends Node

func load_next_level():
	# Get the current scene's file path
	var current_scene_path: String = get_tree().current_scene.scene_file_path
	
	# Check if the current scene is from Stage 1 or any other stage
	var stage_1 = current_scene_path.find("Stage-1") != -1
	var stage_2 = current_scene_path.find("Stage-2") != -1
	var stage_3 = current_scene_path.find("Stage-3") != -1
	
	# Initialize default stage and level numbers
	var current_stage = 1
	var current_level = 1
	
	# Identify the current stage and level from the scene path
	if stage_1:
		current_stage = 1
	elif stage_2:
		current_stage = 2
	elif stage_3:
		current_stage = 3
	
	# Extract the level number from the path by looking for "Level" and the number after
	var level_start = current_scene_path.find("Level") + 5
	if level_start != -1:
		current_level = current_scene_path.substr(level_start, 1).to_int()

	# Check if the current level is 4 or 5
	if current_level == 4 or current_level == 5:
		# Take them to the next stage's level 1 if level 5, or the next level if level 4
		if current_level == 5:
			current_stage += 1
			current_level = 1
		else:
			current_level += 1
	else:
		# Otherwise, just move to the next level
		current_level += 1

	# Construct the path for the next level
	var next_scene_path = "res://levels/Stage-%d Level%d.tscn" % [current_stage, current_level]

	# Check if the next scene exists
	if ResourceLoader.exists(next_scene_path):
		# Load the next scene
		get_tree().change_scene_to_file(next_scene_path)
	else:
		print("Next scene does not exist: ", next_scene_path)
