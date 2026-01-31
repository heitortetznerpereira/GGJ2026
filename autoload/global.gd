extends Node


@onready var gravity : float = ProjectSettings.get_setting(
	"physics/2d/default_gravity"
)

var player : Player
var map : Map
var main : Main


var h_key := false
var b_key := false
var f_key := false

var audio : AudioStreamPlayer

var won_ex := false
var won_re := false
var won_fnaf := false


func _ready() -> void:
	audio = AudioStreamPlayer.new()
	add_child(audio)


func add_key():
	match Global.map.id:
		"H":
			h_key = true
		"B":
			b_key = true
		"F":
			f_key = true


func play_audio(sound : AudioStream, pitch : float = 1, volume : float = 0):
	audio.stop()
	audio.pitch_scale = pitch
	audio.stream = sound
	audio.volume_db = volume
	audio.play()
