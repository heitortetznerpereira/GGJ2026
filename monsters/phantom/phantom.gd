class_name Phantom
extends Area2D


var player : Player
var over_p := false


func _ready() -> void:
	player = Global.player


func start_re():
	pass


func _process(delta: float) -> void:
	if overlaps_body(player):
		player.show_inter("PRESS 'E' TO CHOOSE MASK")
		over_p = true
		if Input.is_action_just_pressed("interact"):
			player.mask_opt()
	else:
		if over_p:
			over_p = false
			player.hide_inter()


func destroy():
	player.hide_inter()
	queue_free()
