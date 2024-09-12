extends AudioStreamPlayer

func _ready():
	play()  # Start playing the background music when the game starts


# Function to handle the CheckButton press
func _on_check_button_pressed():
	if playing:  # If the background music is playing
		stop()   # Stop the music
	else:        # If the background music is stopped
		play()   # Play the music again
