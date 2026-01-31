class_name Map
extends Node2D


@export var tile_map : TileMapLayer
@export var player : Player
@export var phantom : Phantom
@export var re_monster_s : PackedScene


func _ready() -> void:
	Global.map = self
	player.restrict_cam(tile_map)


func start_re():
	phantom.queue_free()
	var re_monster : REMonster = re_monster_s.instantiate()
	re_monster.position = phantom.position
	add_child(re_monster)
