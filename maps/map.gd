class_name Map
extends Node2D


@export var tile_map : TileMapLayer
@export var player : Player
@export var re_manager: REManager
@export var fnaf_manager : FNAFManager


func _ready() -> void:
	Global.map = self
	player.restrict_cam(tile_map)


func start_re():
	re_manager.start_re()


func start_fnaf():
	fnaf_manager.start_fnaf()


func game_over():
	get_tree().quit()
