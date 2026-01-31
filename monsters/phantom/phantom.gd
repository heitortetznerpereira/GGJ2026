class_name Phantom
extends Area2D


@export var inter_area : InterArea


func _process(delta: float) -> void:
	if Input.is_action_just_pressed(
		"interact"
	) and inter_area.player_on:
		Global.player.mask_opt()
