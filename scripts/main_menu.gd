extends Node


func _on_play_pressed():
	get_tree().change_scene_to_file("res://scenes/stage1.tscn")


func _on_learning_materials_pressed():
	get_tree().change_scene_to_file("res://scenes/learning_materials.tscn")

func _on_exit_pressed():
	get_tree().quit()
