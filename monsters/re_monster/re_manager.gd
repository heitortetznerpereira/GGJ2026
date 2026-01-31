class_name REManager
extends Node


@export var phantom : Phantom
@export var monster_scene : PackedScene
var monster : REMonster
@export var health : float = 10
@export var speed : float = 20
@export var delay : float = 3


func start_re():
	phantom.destroy()
	monster = monster_scene.instantiate()
	monster.global_position = phantom.global_position
	monster.speed = speed
	monster.health = health
	await get_tree().create_timer(delay).timeout
	add_child(monster)
