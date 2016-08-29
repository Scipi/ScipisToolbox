
extends Node

signal eval_fitness(particles)
signal update_fitness(particles)
signal update_particles(particles)
signal solution_found(solution)

var _particles = {}

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func add_particle(p):
	if not _particles.has(p.get_instance_ID()):
		_particles[p.get_instance_ID()] = weakref(p)

func cull_particles():
	for p in _particles:
		if not _particles[p].get_ref():
			_particles.erase(p)
			

func eval_fitness():
	emit_signal("eval_fitness", _particles)

func update_fitness():
	emit_signal("update_fitness", _particles)

func update_particles():
	emit_signal("update_particles", _particles)