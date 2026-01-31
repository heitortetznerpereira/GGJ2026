class_name Shotgun
extends Weapon


const DAMAGE : float = 5

@export var ray : RayCast2D


func atk():
	if ray.is_colliding():
		var col := ray.get_collider()
		if col is REMonster:
			col.take_damage(DAMAGE)
