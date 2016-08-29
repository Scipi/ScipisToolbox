
extends Node

# member variables here, example:
# var a=2
# var b="textvar"

var goal

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _calc_vel(p):
	var c1 = 2
	var c2 = 2
	var w = 1
	var newvel = []
	newvel.resize(p.vel.size())
	for t in range(p.vel.size()):
		var r1 = randf()
		var r2 = randf()
		var v = w * p.vel[t] + c1 * r1 * (p.local_best[t] - p.pos[t]) + c2 * r2 * (p.global_best[t] - p.pos[t])
		if v > 100:
			v = 100
		if v < -100:
			v = -100
		newvel[t] = v
	return newvel

func _sort_fitness(a, b):
	return a.get_ref().fitness < b.get_ref().fitness

func eval_fitness(particles):
	for ref in particles:
		var p = particles[ref].get_ref()
		p.pos = [p.get_pos().x, p.get_pos().y]
		p.fitness = eval_particle_fitness(p)

func update_fitness(particles):
	var a = particles.values()
	a.sort_custom(self, "_sort_fitness")
	var g_pos = a[0].get_ref().get_pos()
	var g_best = [g_pos.x, g_pos.y]
	a[0].get_ref().local_best = g_best
	a[0].get_ref().global_best = g_best
	for i in range(1, a.size()):
		var l_pos = a[i-1].get_ref().get_pos()
		a[i].get_ref().local_best = [l_pos.x, l_pos.y]
		a[i].get_ref().global_best = g_best
	

func update_particles(particles):
	for ref in particles:
		var p = particles[ref].get_ref()
		p.vel = _calc_vel(p)

func eval_particle_fitness(p):
	return goal.get_pos().distance_squared_to(p.get_pos())