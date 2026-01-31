class_name Shotgun
extends Weapon


const DAMAGE : float = 5
const STUN : float = 2

@export var ray : RayCast2D
@export var sound : AudioStream


func atk():
	Global.play_audio(sound, 2)
	if ray.is_colliding():
		var col := ray.get_collider()
		if col is REMonster:
			hit.emit()
			col.take_damage(DAMAGE)
			col.stun(STUN)
