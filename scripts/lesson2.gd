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
		"res://Learning Materials/SQL Statement Part 2/SQL Statement Part 2-01.png",
		"res://Learning Materials/SQL Statement Part 2/SQL Statement Part 2-02.png",
		"res://Learning Materials/SQL Statement Part 2/SQL Statement Part 2-03.png",
		"res://Learning Materials/SQL Statement Part 2/SQL Statement Part 2-04.png",
		"res://Learning Materials/SQL Statement Part 2/SQL Statement Part 2-05.png",
		"res://Learning Materials/SQL Statement Part 2/SQL Statement Part 2-06.png",
		"res://Learning Materials/SQL Statement Part 2/SQL Statement Part 2-07.png",
		"res://Learning Materials/SQL Statement Part 2/SQL Statement Part 2-08.png",
		"res://Learning Materials/SQL Statement Part 2/SQL Statement Part 2-09.png",
		"res://Learning Materials/SQL Statement Part 2/SQL Statement Part 2-10.png",
		"res://Learning Materials/SQL Statement Part 2/SQL Statement Part 2-11.png",
		"res://Learning Materials/SQL Statement Part 2/SQL Statement Part 2-12.png",
		"res://Learning Materials/SQL Statement Part 2/SQL Statement Part 2-13.png",
		"res://Learning Materials/SQL Statement Part 2/SQL Statement Part 2-14.png",
		"res://Learning Materials/SQL Statement Part 2/SQL Statement Part 2-15.png",
		"res://Learning Materials/SQL Statement Part 2/SQL Statement Part 2-16.png",
		"res://Learning Materials/SQL Statement Part 2/SQL Statement Part 2-17.png",
		"res://Learning Materials/SQL Statement Part 2/SQL Statement Part 2-18.png",
		"res://Learning Materials/SQL Statement Part 2/SQL Statement Part 2-19.png",
		"res://Learning Materials/SQL Statement Part 2/SQL Statement Part 2-20.png",
		"res://Learning Materials/SQL Statement Part 2/SQL Statement Part 2-21.png",
		"res://Learning Materials/SQL Statement Part 2/SQL Statement Part 2-22.png",
		"res://Learning Materials/SQL Statement Part 2/SQL Statement Part 2-23.png",
		"res://Learning Materials/SQL Statement Part 2/SQL Statement Part 2-24.png",
		"res://Learning Materials/SQL Statement Part 2/SQL Statement Part 2-25.png",
		"res://Learning Materials/SQL Statement Part 2/SQL Statement Part 2-26.png",
		"res://Learning Materials/SQL Statement Part 2/SQL Statement Part 2-27.png",
		"res://Learning Materials/SQL Statement Part 2/SQL Statement Part 2-28.png",
		"res://Learning Materials/SQL Statement Part 2/SQL Statement Part 2-29.png",
		"res://Learning Materials/SQL Statement Part 2/SQL Statement Part 2-30.png",
		"res://Learning Materials/SQL Statement Part 2/SQL Statement Part 2-31.png",
		"res://Learning Materials/SQL Statement Part 2/SQL Statement Part 2-32.png",
		"res://Learning Materials/SQL Statement Part 2/SQL Statement Part 2-33.png",
		"res://Learning Materials/SQL Statement Part 2/SQL Statement Part 2-34.png",
		"res://Learning Materials/SQL Statement Part 2/SQL Statement Part 2-35.png",
		"res://Learning Materials/SQL Statement Part 2/SQL Statement Part 2-36.png",
		"res://Learning Materials/SQL Statement Part 2/SQL Statement Part 2-37.png",
		"res://Learning Materials/SQL Statement Part 2/SQL Statement Part 2-38.png",
		"res://Learning Materials/SQL Statement Part 2/SQL Statement Part 2-39.png",
		"res://Learning Materials/SQL Statement Part 2/SQL Statement Part 2-40.png",
		"res://Learning Materials/SQL Statement Part 2/SQL Statement Part 2-41.png",
		"res://Learning Materials/SQL Statement Part 2/SQL Statement Part 2-42.png",
		"res://Learning Materials/SQL Statement Part 2/SQL Statement Part 2-43.png",
		"res://Learning Materials/SQL Statement Part 2/SQL Statement Part 2-44.png",
		"res://Learning Materials/SQL Statement Part 2/SQL Statement Part 2-45.png",
		"res://Learning Materials/SQL Statement Part 2/SQL Statement Part 2-46.png",
		"res://Learning Materials/SQL Statement Part 2/SQL Statement Part 2-47.png",
		"res://Learning Materials/SQL Statement Part 2/SQL Statement Part 2-48.png",
		"res://Learning Materials/SQL Statement Part 2/SQL Statement Part 2-49.png",
		"res://Learning Materials/SQL Statement Part 2/SQL Statement Part 2-50.png",
		"res://Learning Materials/SQL Statement Part 2/SQL Statement Part 2-51.png",
		"res://Learning Materials/SQL Statement Part 2/SQL Statement Part 2-52.png",
		"res://Learning Materials/SQL Statement Part 2/SQL Statement Part 2-53.png",
		"res://Learning Materials/SQL Statement Part 2/SQL Statement Part 2-54.png",
		"res://Learning Materials/SQL Statement Part 2/SQL Statement Part 2-55.png",
		"res://Learning Materials/SQL Statement Part 2/SQL Statement Part 2-56.png",
		"res://Learning Materials/SQL Statement Part 2/SQL Statement Part 2-57.png",
		"res://Learning Materials/SQL Statement Part 2/SQL Statement Part 2-58.png",
		"res://Learning Materials/SQL Statement Part 2/SQL Statement Part 2-59.png",
		"res://Learning Materials/SQL Statement Part 2/SQL Statement Part 2-60.png",
		"res://Learning Materials/SQL Statement Part 2/SQL Statement Part 2-61.png"
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
