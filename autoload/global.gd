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


func add_key():
	match Global.map.id:
		"H":
			h_key = true
		"B":
			b_key = true
		"F":
			f_key = true
