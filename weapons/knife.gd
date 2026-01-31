class_name Knife
extends Weapon


const DAMAGE : float = 10
const STUN : float = 3

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
