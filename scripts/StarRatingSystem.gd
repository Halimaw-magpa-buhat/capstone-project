extends Control

func _ready():
	self.hide()

func _on_stage_button_pressed():
	GameManager.reset_fruits()  # Reset the collected fruits
	get_tree().paused = false  # Unpause the game
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func _on_next_lvl_pressed():
	GameManager.reset_fruits()  # Reset the collected fruits
	get_tree().paused = false  # Unpause the game
	LevelManager.load_next_level()  # Only load the next level dynamically

func star_rating_system(currentStar: int):
	var star_container = $starContainer
	star_container.updateStars(currentStar)
	
	# Ensure this function is only called when all fruits are collected and questions answered
	if GameManager.are_all_fruits_collected() and GameManager.are_all_questions_answered():
		get_tree().paused = true  # Pause the game
		self.show()  # Only show the star rating system if all conditions are met
