class_name Obj
extends Node2D

signal exorcised(obj : Obj)

@export var sprite : Sprite2D
@export var inter_area : InterArea
@onready var water_sound : AudioStream = load(
	"res://assets/sound/water.wav"
)
var started := false
var haunted := false

func _ready() -> void:
	add_to_group("obj")
	inter_area.monitoring = false
	inter_area.text = "PRESS 'E' TO EXORCISE"


func start():
	inter_area.monitoring = true
	started = true


func haunt():
	sprite.frame = 1
	haunted = true


func exorcise():
	Global.player.holy_water -= 1
	Global.play_audio(water_sound, 2, 0)
	exorcised.emit(self)
	sprite.frame = 0
	inter_area.queue_free()
	started = false
	if haunted:
		haunted = false

func _process(delta: float) -> void:
	if started:
		if inter_area.player_on and Input.is_action_just_pressed(
			"interact"
		):
			exorcise()
