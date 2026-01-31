class_name REMonster
extends Area2D

signal died()

@export var sprite : Sprite2D
@export var anim_control : AnimationPlayer

var speed : float = 40
var stunned := false
var velocity : Vector2
var player : Player
var health : float = 1

func _ready() -> void:
	player = Global.player


func _physics_process(delta: float) -> void:
	if not stunned:
		var dir := (player.global_position - global_position
		).normalized()
		sprite.flip_h = dir.x > 0
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


func stun(time : float):
	stunned = true
	anim_control.play("dam")
	get_tree().create_timer(time).timeout.connect(
		func():
			stunned = false
			anim_control.stop()
	)
