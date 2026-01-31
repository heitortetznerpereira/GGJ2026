class_name ExorcismMonster
extends Area2D


@export var sprite : Sprite2D

var speed : float = 200
var velocity : Vector2
var player : Player

func _ready() -> void:
	player = Global.player
	body_entered.connect(_on_body_entered)


func _physics_process(delta: float) -> void:
	var dir := (player.global_position - global_position
	).normalized()
	sprite.flip_h = dir.x > 0
	velocity = dir * speed
	global_position += velocity * delta


func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		Global.map.game_over()
