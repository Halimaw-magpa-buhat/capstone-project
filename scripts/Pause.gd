extends Node

var is_paused = false
@onready var PauseMenu = $PauseMenu
@onready var settings = $settings

func _ready():
	PauseMenu.visible = false

func _on_settings_pressed():
	get_tree().paused = true
	PauseMenu.visible = true
	

func _on_resume_pressed():
	get_tree().paused = false
	PauseMenu.visible = false

func _on_restart_pressed():
	# Disable processing for all nodes in the pause group before reloading the scene
	PauseMenu.visible = false
	get_tree().paused = false
	GameManager.reset_fruits()  # Reset the collected fruits
	get_tree().reload_current_scene()

func _on_quit_pressed():
	# Disable processing for all nodes in the pause group before changing the scene
	PauseMenu.visible = false
	get_tree().paused = false
	GameManager.reset_fruits()  # Reset the collected fruits
	get_tree().change_scene_to_file("res://scenes/stage1.tscn")
