class_name GWindow
extends Area2D


enum states {
	NORMAL,
	DANGER,
	BOARD
}


var state := states.NORMAL


func change_state(new_state : states):
	state = new_state
	match state:
		states.NORMAL:
			pass
		states.DANGER:
			pass
		states.BOARD:
			pass
