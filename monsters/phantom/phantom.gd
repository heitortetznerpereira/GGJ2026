class_name Phantom
extends Area2D

@onready var bluemask = $bluemask
@onready var redmask = $redmask
@onready var yellowmask = $yellowmask

@export var inter_area : InterArea

func _ready() -> void:
	if Global.won_fnaf:
		bluemask.visible = false
	if Global.won_ex:
		yellowmask.visible = false
	if Global.won_re:
		redmask.visible = false

func _process(delta: float) -> void:
		
	if Input.is_action_just_pressed(
		"interact"
	) and inter_area.player_on:
		Global.player.mask_opt()
