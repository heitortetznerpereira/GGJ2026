class_name Obj
extends Node2D


@export var sprite : Sprite2D
@export var inter_area : InterArea
var started := false


func _ready() -> void:
	inter_area.monitoring = false
	inter_area.text = "PRESS 'E' TO EXORCISE"


func start():
	inter_area.monitoring = true
	started = true


func haunt():
	pass
