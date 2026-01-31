class_name REMonster
extends CharacterBody2D


const BASE_SPEED : float = 40

var player : Player


func _ready() -> void:
	player = Global.player


func _process(delta: float) -> void:
	var dir := (player.global_position - global_position
	).normalized()
	velocity = dir * BASE_SPEED
	move_and_slide()
