extends Control

func _ready():
	self.hide()

func _on_stage_button_pressed():
	GameManager.reset_fruits()  # Reset the collected fruits
	get_tree().paused = false #Collects all data/tree and unpause the game
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func _on_next_lvl_pressed():
	GameManager.reset_fruits()  # Reset the collected fruits
	get_tree().paused = false #Collects all data/tree and unpause the game
	get_tree().change_scene_to_file("res://scenes/Stage-1Level2.tscn")

func star_rating_system(currentStar: int):
	get_tree().paused = false #Collects all data/tree and unpause the game
	var star_container = $starContainer
	star_container.updateStars(currentStar)
	
	# Ensure this function is only called when all fruits are collected and questions answered
	if GameManager.are_all_fruits_collected() and GameManager.are_all_questions_answered():
		get_tree().paused = true  #Collects all data/tree and pauses the game
		self.show()  # Only show the star rating system if all conditions are met
