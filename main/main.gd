class_name Main
extends Node


var map : Map
@export var hub : Hub
@export var b_map : PackedScene


func _ready() -> void:
	Global.main = self
	Engine.max_fps = 60


func load_map(map_scene : PackedScene):
	map = map_scene.instantiate()
	add_child(map)
	hub.hide()


func goto_hub():
	hub.show()
	map.queue_free()
	hub.updt()
