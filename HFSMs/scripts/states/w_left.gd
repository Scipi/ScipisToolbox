
extends Node

onready var agent = get_node("../../../agent")
onready var goal = get_node("../../../l_goal")

func _ready():
	get_parent().register_state(get_name(), self)
	pass

func register_connections(fsm):
	fsm.connect("update", self, "update")

func unregister_connections(fsm):
	fsm.disconnect("update", self, "update")

func update(dt):
	var dist = goal.get_pos() - agent.get_pos()
	var dir = dist.normalized()
	
	var move = dir * 100 * dt
	
	if dist.length() < move.length():
		agent.set_pos(goal.get_pos())
	else:
		agent.set_pos(agent.get_pos() + move)
	
	if agent.get_pos() == goal.get_pos():
		get_parent().change_state("w_right")

