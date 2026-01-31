class_name REMonster
extends Area2D

signal died()

var speed : float = 40
var velocity : Vector2
var player : Player
var health : float = 1

func _ready() -> void:
	player = Global.player


func _physics_process(delta: float) -> void:
	var dir := (player.global_position - global_position
	).normalized()
	velocity = dir * speed
	global_position += velocity * delta


func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		Global.map.game_over()


func take_damage(dam : float):
	health -= dam
	if health <= 0:
		died.emit()
		queue_free()
