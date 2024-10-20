# ProgressManager.gd

extends Node

# Array to store the unlock status for each level in each stage
var level_unlocks = [
	[true, false, false, false, false],  # Stage 1 levels
	[false, false, false, false, false], # Stage 2 levels
	[false, false, false, false, false]  # Stage 3 levels
]

var current_stage = 0  # Track the current stage (starting from 0, which is Stage 1)
var current_level = 0  # Track the current level (starting from 0, which is Level 1)

# Function to unlock the next level based on the current stage and level
func unlock_next_level(stage: int, level: int):
	if stage >= 0 and stage < level_unlocks.size() and level >= 0 and level < level_unlocks[stage].size():
		# Unlock the next level within the current stage
		if level < 4:
			level_unlocks[stage][level + 1] = true  # Unlock next level in the current stage
			print("Next level unlocked: Stage %d Level %d" % [stage + 1, level + 2])
		# If it's the last level of the stage, unlock the first level of the next stage
		elif level == 4 and stage < 2:
			level_unlocks[stage + 1][0] = true  # Unlock first level of the next stage
			print("Stage %d Level 1 unlocked!" % [stage + 2])  # Unlock Stage 2 Level 1 or Stage 3 Level 1

# Function to check if a level is unlocked
func is_level_unlocked(stage: int, level: int) -> bool:
	return level_unlocks[stage][level]

# Function to reset the progress to Stage 1 Level 1
func reset_progress():
	current_stage = 0  # Reset to Stage 1
	current_level = 0  # Reset to Level 1
	print("Progress reset to Stage 1 Level 1")

# Function to set the current stage and level when a level is selected
func set_current_stage_and_level(stage: int, level: int):
	current_stage = stage
	current_level = level
	print("Progress set to Stage %d Level %d" % [stage + 1, level + 1])
