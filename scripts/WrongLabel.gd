extends Label

@onready var timer = $Timer

func wrong_result(message: String, detail: String):
	text = message + " " + detail
	visible = true
	timer.start()

func _on_timer_timeout():
	visible = false
