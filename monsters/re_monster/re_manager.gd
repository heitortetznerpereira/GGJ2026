class_name REManager
extends Manager



@export var health : float = 10
@export var speed : float = 20
@export var delay : float = 3
var weapons : Array[Weapon]


func start():
	phantom.queue_free()
	monster = monster_scene.instantiate()
	monster.died.connect(on_monster_died)
	monster.global_position = phantom.global_position
	monster.speed = speed
	monster.health = health
	for w in get_tree().get_nodes_in_group("weapon"):
		weapons.append(w)
		w.activate()
	await get_tree().create_timer(delay).timeout
	add_child(monster)


func on_monster_died():
	for w in weapons:
		w.queue_free()
	Global.player.drop_weapon()
	Global.map.win()
