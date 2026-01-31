class_name InterArea
extends Area2D


@export_multiline("TEXT HERE") var text : String
var player_on := false


func _ready() -> void:
	body_entered.connect(on_body_entered)
	body_exited.connect(on_body_exited)


func on_body_entered(body : Node2D):
	if body is Player:
		body.show_inter(text)
		player_on = true


func on_body_exited(body : Node2D):
	if body is Player:
		body.hide_inter()
		player_on = false
