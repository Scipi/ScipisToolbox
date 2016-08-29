
extends Node2D

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	get_node("splash").set_z(0)
	var bbc = get_node("BackBufferCopy")
	bbc.set_z(1)
	bbc.set_copy_mode(bbc.COPY_MODE_VIEWPORT)
	get_node("shrowd").set_z(2)
	get_node("stencil").set_z(3)
	set_process(true)

func _process(delta):
	get_node("stencil").set_pos(get_local_mouse_pos())
