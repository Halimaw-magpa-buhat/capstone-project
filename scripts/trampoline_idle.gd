extends Node

func enter():
	object.animatedSprite2D.play("idle")
	
func _physics_process(delta):
	if object.animatedSprite2D.is_playing():
		change_state("idle")
	
	
