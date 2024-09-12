extends Node

func load_next_level():
	# Get the current scene's file path
	var current_scene_path: String = get_tree().current_scene.scene_file_path

	# Find the positions of "Stage-" and "Level" in the path
	var stage_start = current_scene_path.find("Stage-")
	var level_start = current_scene_path.find("Level")

	# Ensure we found both "Stage-" and "Level"
	if stage_start == -1 or level_start == -1:
		print("Could not parse current level path.")
		return

	# Extract stage and level numbers from the path
	var current_stage = current_scene_path.substr(stage_start + 6, 1).to_int() # "Stage-" is 6 characters long
	var current_level = current_scene_path.substr(level_start + 5, 1).to_int() # "Level" is 5 characters long

	# Check if it's the last level of the stage
	if current_level == 5:
		current_stage += 1
		current_level = 1
	else:
		current_level += 1

	# Check if we have exceeded the number of stages
	if current_stage > 3:
		print("No more stages.")
		return

	# Construct the path for the next level
	var next_scene_path = "res://levels/Stage-%d Level%d.tscn" % [current_stage, current_level]

	# Check if the next scene exists
	if ResourceLoader.exists(next_scene_path):
		# Load the next scene
		get_tree().change_scene_to_file(next_scene_path)
	else:
		print("Next scene does not exist: ", next_scene_path)
