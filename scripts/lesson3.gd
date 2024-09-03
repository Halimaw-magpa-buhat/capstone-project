extends Node2D

# Array to store the loaded images
var pages: Array[Texture] = []
# Current page index
var current_page: int = 0

# A reference to the TextureRect node where the image will be displayed
@onready var image_display: TextureRect = $TextureRect

# Load all the images at the start
func _ready():
	load_images("res://Learning Materials/SQL Statement Part 3/")
	show_page(current_page)

# Function to load all images from a directory
func load_images(path: String):
	var dir = DirAccess.open(path)
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if file_name.ends_with(".png"): # Adjust this if you used a different image format
				var img_path = path + file_name
				var img_texture = load(img_path)
				pages.append(img_texture)
			file_name = dir.get_next()
		dir.list_dir_end()

# Function to display the current page
func show_page(index: int):
	if index >= 0 and index < pages.size():
		image_display.texture = pages[index]

# Function to go to the next page
func _on_next_page_pressed():
	if current_page < pages.size() - 1:
		current_page += 1
		show_page(current_page)

# Function to go to the previous page
func _on_previous_page_pressed():
	if current_page > 0:
		current_page -= 1
		show_page(current_page)

func _on_exit_pressed():
	get_tree().change_scene_to_file("res://scenes/learning_materials.tscn")



