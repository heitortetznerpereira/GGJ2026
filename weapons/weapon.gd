class_name Weapon
extends CharacterBody2D


var picked := true


func pick():
	picked = true
	collision_layer = 0


func drop():
	picked = false
	collision_layer = 8


func _process(delta: float) -> void:
	if not picked and not is_on_floor():
		velocity.y += Global.gravity * delta
		move_and_slide()
