@abstract
class_name Weapon
extends CharacterBody2D

signal hit

@export var inter_area : InterArea
var picked := false


func _ready() -> void:
	hide()
	add_to_group("weapon")
	inter_area.monitoring = false
	hit.connect(on_hit)


func on_hit():
	Global.player.drop_weapon()
	queue_free()


func activate():
	inter_area.monitoring = true
	show()


func pick():
	picked = true
	collision_layer = 0
	inter_area.monitoring = false


func drop():
	picked = false
	collision_layer = 8
	inter_area.monitoring = true
	global_rotation = 0


func _process(delta: float) -> void:
	if not picked:
		velocity.y += Global.gravity * delta
		move_and_slide()
	if Input.is_action_just_pressed(
		"interact"
	) and inter_area.player_on:
		Global.player.equip_weapon(self)
		pick()


@abstract func atk()
