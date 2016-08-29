
extends Node2D
export(Texture) var tex

var lines = []

func _ready():
	randomize()
	# Called every time the node is added to the scene.
	# Initialization here
	set_process_input(true)
	pass

func _input(ev):
	if ev.type == InputEvent.MOUSE_BUTTON and ev.button_index == BUTTON_LEFT and ev.pressed:
		var p1 = Vector2(rand_range(-50, 50), rand_range(-50, 50))
		var p2 = Vector2(rand_range(-50, 50), rand_range(-50, 50))
		var c = Color(255, 255, 255)
		var d = {points = Vector2Array([p1, p2]), color = ColorArray([c, c])}
		lines.push_back(d)
		update()

func _draw():
	for l in lines:
		var uvs = Vector2Array(l.points)
		for i in range(uvs.size()):
			var uv = uvs[i]
			uv += Vector2(50, 50)
			uv /= 100
			uvs[i] = uv
		draw_primitive(l.points, l.color, uvs, tex)