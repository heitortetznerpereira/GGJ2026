class_name Hub
extends Control


@export var building_btn : Button
@export var house_btn : Button
@export var factory_btn : Button
@export var key_lbl : Label
var key_amount : int = 0
@export var escape_btn : Button


func _ready() -> void:
	escape_btn.hide()


func _on_building_btn_pressed() -> void:
	Global.main.load_map(Global.main.b_map)


func updt():
	key_amount = 0
	if Global.b_key:
		building_btn.disabled = true
		key_amount += 1
	if Global.h_key:
		house_btn.disabled = true
		key_amount += 1
	if Global.f_key:
		factory_btn.disabled = true
		key_amount += 1
	key_lbl.text = str(key_amount) + "/3 KEYS OBTAINED"
	if key_amount == 3:
		escape_btn.show()


func _on_tutorial_btn_pressed() -> void:
	Global.main.load_map(Global.main.tutorial)


func _on_house_btn_pressed() -> void:
	Global.main.load_map(Global.main.h_map)


func _on_factory_btn_pressed() -> void:
	Global.main.load_map(Global.main.f_map)


func _on_escape_btn_pressed() -> void:
	Global.main.goto_victory()
