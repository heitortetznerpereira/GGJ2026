class_name Knife
extends Weapon


const DAMAGE : float = 10

@export var ray : RayCast2D


func atk():
	if ray.is_colliding():
		var col := ray.get_collider()
		if col is REMonster:
			hit.emit()
			col.take_damage(DAMAGE)
