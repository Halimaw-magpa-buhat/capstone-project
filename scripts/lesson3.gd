extends Node2D

# Array to store the loaded images
var pages: Array[Texture] = []
# Current page index
var current_page: int = 0

# A reference to the TextureRect node where the image will be displayed
@onready var image_display: TextureRect = $TextureRect

# Load the images at the start
func _ready():
	# Load the images manually
	load_images()
	
	# Show the first page if images are loaded
	if pages.size() > 0:
		show_page(current_page)

# Load the images manually by specifying the file paths
func load_images():
	# List of image paths
	var img_paths = [
		"res://Learning Materials/SQL Statement Part 3/SQL Statement Part 3-01.png",
		"res://Learning Materials/SQL Statement Part 3/SQL Statement Part 3-02.png",
		"res://Learning Materials/SQL Statement Part 3/SQL Statement Part 3-03.png",
		"res://Learning Materials/SQL Statement Part 3/SQL Statement Part 3-04.png",
		"res://Learning Materials/SQL Statement Part 3/SQL Statement Part 3-05.png",
		"res://Learning Materials/SQL Statement Part 3/SQL Statement Part 3-06.png",
		"res://Learning Materials/SQL Statement Part 3/SQL Statement Part 3-07.png",
		"res://Learning Materials/SQL Statement Part 3/SQL Statement Part 3-08.png",
		"res://Learning Materials/SQL Statement Part 3/SQL Statement Part 3-09.png",
		"res://Learning Materials/SQL Statement Part 3/SQL Statement Part 3-10.png",
		"res://Learning Materials/SQL Statement Part 3/SQL Statement Part 3-11.png",
		"res://Learning Materials/SQL Statement Part 3/SQL Statement Part 3-12.png",
		"res://Learning Materials/SQL Statement Part 3/SQL Statement Part 3-13.png",
		"res://Learning Materials/SQL Statement Part 3/SQL Statement Part 3-14.png",
		"res://Learning Materials/SQL Statement Part 3/SQL Statement Part 3-15.png",
		"res://Learning Materials/SQL Statement Part 3/SQL Statement Part 3-16.png",
		"res://Learning Materials/SQL Statement Part 3/SQL Statement Part 3-17.png",
		"res://Learning Materials/SQL Statement Part 3/SQL Statement Part 3-18.png",
		"res://Learning Materials/SQL Statement Part 3/SQL Statement Part 3-19.png",
		"res://Learning Materials/SQL Statement Part 3/SQL Statement Part 3-20.png",
		"res://Learning Materials/SQL Statement Part 3/SQL Statement Part 3-21.png",
		"res://Learning Materials/SQL Statement Part 3/SQL Statement Part 3-22.png",
		"res://Learning Materials/SQL Statement Part 3/SQL Statement Part 3-23.png",
		"res://Learning Materials/SQL Statement Part 3/SQL Statement Part 3-24.png",
		"res://Learning Materials/SQL Statement Part 3/SQL Statement Part 3-25.png",
		"res://Learning Materials/SQL Statement Part 3/SQL Statement Part 3-26.png",
		"res://Learning Materials/SQL Statement Part 3/SQL Statement Part 3-27.png",
		"res://Learning Materials/SQL Statement Part 3/SQL Statement Part 3-28.png",
		"res://Learning Materials/SQL Statement Part 3/SQL Statement Part 3-29.png",
		"res://Learning Materials/SQL Statement Part 3/SQL Statement Part 3-30.png",
		"res://Learning Materials/SQL Statement Part 3/SQL Statement Part 3-31.png",
		"res://Learning Materials/SQL Statement Part 3/SQL Statement Part 3-32.png",
		"res://Learning Materials/SQL Statement Part 3/SQL Statement Part 3-33.png",
		"res://Learning Materials/SQL Statement Part 3/SQL Statement Part 3-34.png",
		"res://Learning Materials/SQL Statement Part 3/SQL Statement Part 3-35.png",
		"res://Learning Materials/SQL Statement Part 3/SQL Statement Part 3-36.png",
		"res://Learning Materials/SQL Statement Part 3/SQL Statement Part 3-37.png",
		"res://Learning Materials/SQL Statement Part 3/SQL Statement Part 3-38.png",
		"res://Learning Materials/SQL Statement Part 3/SQL Statement Part 3-39.png",
		"res://Learning Materials/SQL Statement Part 3/SQL Statement Part 3-40.png",
		"res://Learning Materials/SQL Statement Part 3/SQL Statement Part 3-41.png",
		"res://Learning Materials/SQL Statement Part 3/SQL Statement Part 3-42.png",
		"res://Learning Materials/SQL Statement Part 3/SQL Statement Part 3-43.png",
		"res://Learning Materials/SQL Statement Part 3/SQL Statement Part 3-44.png",
		"res://Learning Materials/SQL Statement Part 3/SQL Statement Part 3-45.png",
		"res://Learning Materials/SQL Statement Part 3/SQL Statement Part 3-46.png",
		"res://Learning Materials/SQL Statement Part 3/SQL Statement Part 3-47.png",
		"res://Learning Materials/SQL Statement Part 3/SQL Statement Part 3-48.png",
		"res://Learning Materials/SQL Statement Part 3/SQL Statement Part 3-49.png",
		"res://Learning Materials/SQL Statement Part 3/SQL Statement Part 3-50.png",
		"res://Learning Materials/SQL Statement Part 3/SQL Statement Part 3-51.png",
		"res://Learning Materials/SQL Statement Part 3/SQL Statement Part 3-52.png",
		"res://Learning Materials/SQL Statement Part 3/SQL Statement Part 3-53.png",
		"res://Learning Materials/SQL Statement Part 3/SQL Statement Part 3-54.png",
		"res://Learning Materials/SQL Statement Part 3/SQL Statement Part 3-55.png",
		"res://Learning Materials/SQL Statement Part 3/SQL Statement Part 3-56.png",
		"res://Learning Materials/SQL Statement Part 3/SQL Statement Part 3-57.png",
		"res://Learning Materials/SQL Statement Part 3/SQL Statement Part 3-58.png"
	]

	# Iterate through the image paths and load them
	for img_path in img_paths:
		var img_texture = load(img_path)
		if img_texture:
			pages.append(img_texture)

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

# Function to handle exit button
func _on_exit_pressed():
	get_tree().change_scene_to_file("res://scenes/learning_materials.tscn")
