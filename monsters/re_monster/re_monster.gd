class_name REMonster
extends CharacterBody2D


const BASE_SPEED : float = 40

@export var target : Player


func _process(delta: float) -> void:
	var dir := (target.global_position - global_position
	).normalized()
	velocity = dir * BASE_SPEED
	move_and_slide()
