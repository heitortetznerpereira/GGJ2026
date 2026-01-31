class_name Hub
extends Control


@export var building_btn : Button
@export var house_btn : Button
@export var factory_btn : Button


func _on_building_btn_pressed() -> void:
	Global.main.load_map(Global.main.b_map)


func updt():
	if Global.b_key:
		building_btn.disabled = true
	if Global.h_key:
		house_btn.disabled = true
	if Global.f_key:
		factory_btn.disabled = true


func _on_tutorial_btn_pressed() -> void:
	Global.main.load_map(Global.main.tutorial)


func _on_house_btn_pressed() -> void:
	Global.main.load_map(Global.main.h_map)


func _on_factory_btn_pressed() -> void:
	Global.main.load_map(Global.main.f_map)
