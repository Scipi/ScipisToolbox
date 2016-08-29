
extends Node2D

# member variables here, example:
# var a=2
# var b="textvar"

export(float) var radius = 100

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _draw():
	draw_circle(Vector2(0, 0), radius, Color(255, 255, 255))
