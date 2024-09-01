extends Node


func _on_play_pressed():
	get_tree().change_scene_to_file("res://scenes/stage1.tscn")


func _on_learning_materials_pressed():
	pass # Replace with function body.

func _on_exit_pressed():
	get_tree().quit()
