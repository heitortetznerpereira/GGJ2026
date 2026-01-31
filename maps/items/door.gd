class_name Door
extends Node2D


@export var inter_area : InterArea

var locked := false


func lock():
	modulate.a = 0.25
	locked = true
	inter_area.monitoring = false


func unlock():
	modulate.a = 1
	locked = false
	inter_area.monitoring = true


func _process(delta: float) -> void:
	if Input.is_action_just_pressed(
		"interact"
	) and inter_area.player_on:
		if not locked:
			Global.main.goto_hub()
