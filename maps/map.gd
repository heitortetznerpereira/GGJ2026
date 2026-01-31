class_name Map
extends Node2D


@export var tile_map : TileMapLayer
@export var player : Player
@export var re_manager: REManager
@export var fnaf_manager : FNAFManager
@export var exorcism_manager : ExManager
@export var key : Key
@export_enum("H", "B", "F") var id : String


@onready var key_sound : AudioStream = load(
	"res://assets/sound/key.wav"
)


func _ready() -> void:
	Global.map = self
	player.restrict_cam(tile_map)


func start_re():
	for i in get_tree().get_nodes_in_group("door"):
		i.lock()
	re_manager.start()


func start_fnaf():
	for i in get_tree().get_nodes_in_group("door"):
		i.lock()
	fnaf_manager.start()


func start_exorcism():
	for i in get_tree().get_nodes_in_group("door"):
		i.lock()
	exorcism_manager.start()


func win():
	key.start()
	Global.audio.stop()
	Global.audio.stream = key_sound
	Global.audio.pitch_scale = 2
	Global.audio.play()


func game_over():
	get_tree().quit()
