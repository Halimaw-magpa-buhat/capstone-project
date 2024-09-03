extends Node



func _on_s_2_lvl_1_pressed():
	get_tree().change_scene_to_file("res://scenes/Stage-2 Level1.tscn")


func _on_s_2_lvl_2_pressed():
	get_tree().change_scene_to_file("res://scenes/Stage-2 Level2.tscn")


func _on_s_2_lvl_3_pressed():
	get_tree().change_scene_to_file("res://scenes/Stage-2 Level3.tscn")


func _on_s_2_lvl_4_pressed():
	get_tree().change_scene_to_file("res://scenes/Stage-2 Level4.tscn")


func _on_s_2_lvl_5_pressed():
	get_tree().change_scene_to_file("res://scenes/Stage-2 Level5.tscn")


func _on_nxt_pressed():
	get_tree().change_scene_to_file("res://scenes/stage3.tscn")


func _on_back_pressed():
	get_tree().change_scene_to_file("res://scenes/stage1.tscn")
