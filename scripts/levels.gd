extends Node


func _on_level_1_button_pressed():
	get_tree().change_scene_to_file("res://scenes/Stage-1Level1.tscn")
	
func _on_level_2_button_pressed():
	get_tree().change_scene_to_file("res://scenes/Stage-1Level2.tscn")
	
func _on_level_3_button_pressed():
	get_tree().change_scene_to_file("res://scenes/Stage-1 Level3.tscn")
	

func _on_level_4_button_pressed():
	get_tree().change_scene_to_file("res://scenes/stage-1 Level4.tscn")
	

func _on_level_5_button_pressed():
	get_tree().change_scene_to_file("res://scenes/Stage-1 Level5.tscn")


func _on_next_pressed():
	get_tree().change_scene_to_file("res://scenes/stage2.tscn")

func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")




