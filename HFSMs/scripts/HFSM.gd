
extends Node

signal enter
signal exit
signal resume
signal stop

signal process_input(ev)
signal update(dt)
signal update_fixed(dt)

signal draw

var states = {}
var active_state
export(NodePath)var FSM
export(String)var initial_state

func _ready():
	if FSM:
		FSM = get_node(FSM)
		FSM.register_state(get_name(), self)
	if initial_state:
		change_state(initial_state, true)

func register_connections(FSM):
	FSM.connect("enter", self, "enter")
	FSM.connect("exit", self, "exit")
	FSM.connect("resume", self, "resume")
	FSM.connect("stop", self, "stop")
	FSM.connect("process_input", self, "process_input")
	FSM.connect("update", self, "update")
	FSM.connect("update_fixed", self, "update_fixed")
	FSM.connect("draw", self, "draw")
	

func unregister_connections(FSM):
	FSM.disconnect("enter", self, "enter")
	FSM.disconnect("exit", self, "exit")
	FSM.disconnect("resume", self, "resume")
	FSM.disconnect("stop", self, "stop")
	FSM.disconnect("process_input", self, "process_input")
	FSM.disconnect("update", self, "update")
	FSM.disconnect("update_fixed", self, "update_fixed")
	FSM.disconnect("draw", self, "draw")

func register_state(name, s):
	states[name] = s

func change_state(name, restart = false):
	if restart:
		emit_signal("exit")
	else:
		emit_signal("stop")
	
	if active_state:
		active_state.unregister_connections(self)
	active_state = states[name]
	if active_state:
		active_state.register_connections(self)
	
	if restart:
		emit_signal("enter")
	else:
		emit_signal("resume")

func enter():
	emit_signal("enter")
func exit():
	emit_signal("exit")
func resume():
	emit_signal("resume")
func stop():
	emit_signal("stop")

func process_input(ev):
	emit_signal("process_input", ev)
func update(dt):
	emit_signal("update", dt)
func update_fixed(dt):
	emit_signal("update_fixed", dt)
func draw():
	emit_signal("draw")