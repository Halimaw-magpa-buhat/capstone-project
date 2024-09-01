extends HBoxContainer

@onready var StarGuiClass = preload("res://gui/star_gui.tscn")

func setMaxStars(max: int):
	clear_stars()
	for i in range(max):
		var stars = StarGuiClass.instantiate()
		add_child(stars)

func updateStars(currentStar: int):
	var stars = get_children()
	
	# Turn on the correct number of stars
	for i in range(currentStar):
		stars[i].update(true)
		
	# Turn off the remaining stars
	for i in range(currentStar, stars.size()):
		stars[i].update(false)

func clear_stars():
	for child in get_children():
		child.queue_free()
