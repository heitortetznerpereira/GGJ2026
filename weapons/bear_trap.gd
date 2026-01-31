class_name BearTrap
extends Weapon


const DAMAGE : float = 2
const STUN : float = 5

@export var damage_area : Area2D
@export var sprite : Sprite2D
@export var sound : AudioStream


func _ready() -> void:
	damage_area.monitoring = false
	damage_area.area_entered.connect(on_area_entered)
	super()


func atk():
	Global.player.drop_weapon()
	damage_area.monitoring = true
	sprite.frame = 0


func on_area_entered(area : Area2D):
	if area is REMonster:
		Global.play_audio(sound)
		area.take_damage(DAMAGE)
		area.stun(STUN)
		queue_free()


func pick():
	sprite.frame = 1
	damage_area.monitoring = false
	super()
