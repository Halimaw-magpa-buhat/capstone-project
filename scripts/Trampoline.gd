extends Area2D

@onready var animatedSprite2d = $AnimatedSprite2D

func _on_body_entered(body):
	animatedSprite2d.play("jump")
