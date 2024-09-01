extends Panel

@onready var sprite = $Sprite2D

func update(whole: bool):
	# Update the frame based on the `whole` parameter
	if whole:
		sprite.frame = 0
	else:
		sprite.frame = 2
	
	# Ensure the sprite remains at the specified position
	sprite.position = Vector2(-11, -69)
