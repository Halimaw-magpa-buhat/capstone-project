extends Label

# Function to display correct or wrong result
func display_result(message: String, detail: String):
	text = message + " " + detail
	visible = true
	# Optionally, you can add a timer to hide the result after a few seconds
	var timer = Timer.new()
	timer.set_wait_time(3)  # Hides after 3 seconds
	add_child(timer)
	timer.start()

func _on_timer_timeout():
	visible = false
