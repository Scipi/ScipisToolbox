
extends Node2D

# member variables here, example:
# var a=2
# var b="textvar"
var local_best = [0, 0]
var global_best = [0, 0]
var pos = [0, 0]
var fitness = 0
var vel = [0, 0]

func _ready():
	set_pos(Vector2(rand_range(0, 1000), rand_range(0, 1000)))
	set_fixed_process(true)
	pass

func _fixed_process(delta):
	var p = get_pos()
	look_at(p + Vector2(vel[0], vel[1]))
	set_pos(p + Vector2(vel[0], vel[1]) * delta)

func _draw():
	var points = Vector2Array([])
	points.push_back(Vector2(0, 5))
	points.push_back(Vector2(-3, -5))
	points.push_back(Vector2(3, -5))
	draw_colored_polygon(points, Color(rand_range(0, 256), rand_range(0, 256), rand_range(0, 256)))
	


