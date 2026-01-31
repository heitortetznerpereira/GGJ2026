class_name InterArea
extends Area2D


@export var label : Label

var player : Player


func _ready() -> void:
	label.hide()
	body_entered.connect(on_body_entered)
	body_exited.connect(on_body_exited)


func on_body_entered(body : Node2D):
	if body is Player:
		label.show()


func on_body_exited(body : Node2D):
	if body is Player:
		label.hide()
