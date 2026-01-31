class_name Key
extends Node2D


@export var inter_area : InterArea


func _ready() -> void:
	inter_area.monitoring = false
	hide()


func start():
	inter_area.monitoring = true
	show()


func _process(delta: float) -> void:
	if inter_area.player_on and Input.is_action_just_pressed(
		"interact"
	):
		queue_free()
		Global.player.add_key()
