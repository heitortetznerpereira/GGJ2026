class_name Main
extends Node


var map : Map
@export var hub : Hub
@export var b_map : PackedScene
@export var tutorial : PackedScene
@export var h_map : PackedScene
@export var f_map : PackedScene


func _ready() -> void:
	Global.main = self
	Engine.max_fps = 60
	goto_hub()


func load_map(map_scene : PackedScene):
	map = map_scene.instantiate()
	add_child(map)
	hub.hide()


func goto_hub():
	hub.show()
	if map : map.queue_free()
	hub.updt()
