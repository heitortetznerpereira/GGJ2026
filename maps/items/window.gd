class_name GWindow
extends Area2D


enum states {
	NORMAL,
	DANGER,
	BOARD
}

@export var sprite : Sprite2D
@export var inter_area : InterArea

var state := states.NORMAL
var in_danger := false
var boarded := false
var started := false


func _ready() -> void:
	change_state(states.NORMAL)
	inter_area.monitoring = false


func start():
	inter_area.monitoring = true
	started = true


func change_state(new_state : states):
	state = new_state
	match state:
		states.NORMAL:
			sprite.frame = 4
		states.DANGER:
			sprite.frame = 0
		states.BOARD:
			sprite.frame = 2


func danger():
	in_danger = true
	sprite.modulate = Color.RED
	if state != states.BOARD:
		change_state(states.DANGER)		


func clear():
	sprite.modulate = Color.WHITE
	if state != states.BOARD:
		state = states.NORMAL
	in_danger = false


func board():
	boarded = true
	change_state(states.BOARD)


func unboard():
	boarded = false
	if in_danger:
		change_state(states.DANGER)
	else:
		change_state(states.NORMAL)


func _process(delta: float) -> void:
	if started:
		check_board()
	


func check_board():
	if inter_area.player_on and Input.is_action_just_pressed(
		"interact"
	):
		if boarded:
			unboard()
			Global.player.boards += 1
		elif Global.player.boards >= 1:
			board()
			Global.player.boards -= 1


func attack():
	print("attack window")
