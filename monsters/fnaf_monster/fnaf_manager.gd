class_name FNAFManager
extends Node


@export var change_timer : Timer
@export var change_time : float = 5
@export_range(0, 1, 0.1) var move_chance : float = 0.5

var windows : Array[GWindow]
var curr_window : GWindow


func _ready() -> void:
	windows.assign(get_tree().get_nodes_in_group("window"))
	change_timer.wait_time = change_time
	change_timer.timeout.connect(try_move)


func start_fnaf():
	for w in windows:
		w.start()
	change_timer.start()


func try_move():
	var rng := randf()
	if move_chance > rng:
		atk_window()


func atk_window():
	if curr_window:
		if curr_window.state != GWindow.states.BOARD:
			curr_window.attack()
			return
		curr_window.clear()
	curr_window = windows.pick_random() as GWindow
	curr_window.danger()
