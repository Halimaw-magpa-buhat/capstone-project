extends Node

func enter():
	object.animatedSprite2D.play("jump")
	object.player.velocity.y = 300
	
func _physics_process(delta):
	if not object.animatedSprite2D.is_playing():
		change_state("idle")
