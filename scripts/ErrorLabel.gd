extends Label

# Function to show an error message
func show_error_message(message: String):
	text = message
	visible = true
	# Optionally, you can add a timer to hide the error after a few seconds
	var timer = Timer.new()
	timer.set_wait_time(3)  # Hides after 3 seconds
	add_child(timer)
	timer.start()

func _on_timer_timeout():
	visible = false
