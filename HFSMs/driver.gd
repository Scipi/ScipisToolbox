
extends Node

# member variables here, example:
# var a=2
# var b="textvar"

onready var HFSM = get_node("HFSM")

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process(true)
	pass

func _process(delta):
	HFSM.update(delta)



