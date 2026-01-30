class_name Player
extends CharacterBody2D


const BASE_SPEED : float = 60


func move():
	var input_dir := Input.get_vector("move_left", "move_right",
	"move_up", "move_down")
	velocity = input_dir * BASE_SPEED
	move_and_slide()
