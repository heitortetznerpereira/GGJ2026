class_name InterArea
extends Area2D

@export var label : Label
@export var n_body : Node

var player : Player



func _ready() -> void:
	label.hide()
	body_entered.connect(on_body_entered)
	body_exited.connect(on_body_exited)


func on_body_entered(body : Node2D):
	if body is Player:
		player = body
		player.inter_area = self
		label.show()


func on_body_exited(body : Node2D):
	if body is Player:
		player = null
		await get_tree().physics_frame
		Global.player.inter_area = null
		label.hide()


func _physics_process(delta: float) -> void:
	if player and Input.is_action_just_pressed("interact"):
		n_body.on_interact()
