
extends Node2D

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	randomize()
	for i in range(0, 100):
		var b = preload("res://PSO/scenes/BURD.tscn").instance()
		add_child(b)
		get_node("PSO").add_particle(b)
		get_node("PSO/PSO_inst").goal = get_node("goal")
	set_process(true)

func _process(delta):
	var pso = get_node("PSO")
	pso.cull_particles()
	pso.eval_fitness()
	pso.update_fitness()
	pso.update_particles()
	var goal = get_node("goal")
	goal.set_pos(get_local_mouse_pos())