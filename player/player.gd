class_name Player
extends CharacterBody2D


const BASE_SPEED : float = 60

@export var main_cam : Camera2D
@export var stairs_area : Area2D
@export var hud : HUD

var inter_area : InterArea
var speed := BASE_SPEED


func _ready() -> void:
	Global.player = self


func _process(delta: float) -> void:
	move(delta)


func move(delta : float):
	var input_dir := Vector2(
		Input.get_axis("move_left", "move_right"),
		Input.get_axis("move_up", "move_down")
	)
	velocity.x = input_dir.x * speed
	if stairs_area.has_overlapping_bodies() and input_dir.y:
		velocity.y = input_dir.y * speed
	elif not is_on_floor():
		velocity.y += Global.gravity * delta
	move_and_slide()


func restrict_cam(tile_map : TileMapLayer):
	var rect := tile_map.get_used_rect()
	var size := tile_map.tile_set.tile_size
	main_cam.limit_left = rect.position.x * size.x
	main_cam.limit_top = rect.position.y * size.y
	main_cam.limit_right = rect.end.x * size.x
	main_cam.limit_bottom = rect.end.y * size.y


func mask_opt():
	speed = 0
	hud.masks.show()


func start_re():
	speed = BASE_SPEED
	Global.map.start_re()
	inter_area.queue_free()
	inter_area = null
