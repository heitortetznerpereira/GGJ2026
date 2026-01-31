class_name Obj
extends Node2D

signal exorcised

@export var sprite : Sprite2D
@export var inter_area : InterArea
var started := false
var haunted := false

func _ready() -> void:
	add_to_group("obj")
	inter_area.monitoring = false
	inter_area.text = "PRESS 'E' TO EXORCISE"


func start():
	inter_area.monitoring = true
	started = true


func haunt():
	sprite.frame = 1
	haunted = true


func exorcise():
	sprite.frame = 0
	inter_area.queue_free()
	started = false
	if haunted:
		haunted = false
		exorcised.emit()

func _process(delta: float) -> void:
	if started:
		if inter_area.player_on and Input.is_action_just_pressed(
			"interact"
		):
			exorcise()
