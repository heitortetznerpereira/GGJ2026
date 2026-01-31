class_name Map
extends Node2D


@export var tile_map : TileMapLayer
@export var player : Player


func _ready() -> void:
	player.restrict_cam(tile_map)
