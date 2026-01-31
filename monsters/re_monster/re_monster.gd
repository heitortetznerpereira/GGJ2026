class_name REMonster
extends Area2D


const BASE_SPEED : float = 40

var velocity : Vector2
var player : Player


func _ready() -> void:
	player = Global.player


func _physics_process(delta: float) -> void:
	var dir := (player.global_position - global_position
	).normalized()
	velocity = dir * BASE_SPEED
	global_position += velocity * delta


func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		Global.map.game_over()
