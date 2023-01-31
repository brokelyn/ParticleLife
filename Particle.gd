extends Node2D

var velocity = Vector2.ZERO
var color = Color.white
var code = "#FFFFFF"

var damping = 0.99
var maxSpeed = 1

func _process(delta):
	velocity = Vector2(min(velocity.x, maxSpeed),
				   min(velocity.y, maxSpeed))
					
	position += velocity
	velocity = Vector2(velocity.x * damping,
					   velocity.y * damping)
