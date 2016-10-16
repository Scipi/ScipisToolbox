extends Camera2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

onready var tween = get_node("Tween")

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process_input(true)
	pass

func _input(event):
	if event.type == InputEvent.MOUSE_BUTTON and event.button_index == BUTTON_LEFT and event.pressed:
		shake()

func shake():
	var s_pos = get_pos()
	s_pos.y -= 40
	tween.interpolate_property(self, "transform/pos", s_pos, get_pos(), .5, tween.TRANS_ELASTIC, tween.EASE_OUT, 0.0)
	tween.start()
	pass
