class_name HUD
extends Control


@export var player : Player
@export var masks : Control
@export var inter_lbl : Label


func _ready() -> void:
	masks.hide()


func _on_re_btn_pressed() -> void:
	player.start_re()
	masks.hide()


func _on_ex_btn_pressed() -> void:
	masks.hide()


func _on_fnaf_btn_pressed() -> void:
	masks.hide()
