class_name Main
extends Node


var map : Map
@export var hub : Hub
@export var b_map : PackedScene
@export var tutorial : PackedScene
@export var h_map : PackedScene
@export var f_map : PackedScene
@export var game_over : GameOver
@export var game_over_sound : AudioStream
@export var victory : Victory


func _ready() -> void:
	Global.main = self
	Engine.max_fps = 60
	game_over.retry_btn.pressed.connect(
		goto_hub
	)
	victory.hide()
	game_over.hide()
	goto_hub()


func load_map(map_scene : PackedScene):
	map = map_scene.instantiate()
	add_child(map)
	hub.hide()


func goto_hub():
	game_over.hide()
	hub.show()
	if map : map.queue_free()
	hub.updt()


func goto_gameover():
	Global.play_audio(game_over_sound, 2)
	map.queue_free()
	game_over.show()


func goto_victory():
	hub.hide()
	victory.show()
