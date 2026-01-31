class_name ExManager
extends Manager

var objects : Array[Obj]
var non_haunt_obj : Array[Obj]
@export var haunt_amount : int = 3
@export var holy_water : int = 4


func start():
	phantom.queue_free()
	Global.player.holy_water = holy_water
	Global.player.set_exor(true)
	objects.assign(get_tree().get_nodes_in_group("obj"))
	for i in objects:
		i.start()
		i.exorcised.connect(on_obj_exorcised)
	non_haunt_obj.assign(objects)
	for i in haunt_amount:
		var choose := non_haunt_obj.pick_random() as Obj
		choose.haunt()
		non_haunt_obj.erase(choose)


func on_obj_exorcised(obj : Obj):
	if obj.haunted:
		haunt_amount -= 1
		if haunt_amount <= 0:
			win()
			return
		if Global.player.holy_water == 0:
			die()


func win():
	Global.player.set_exor(false)
	Global.map.win()


func die():
	Global.player.set_exor(false)
	monster = monster_scene.instantiate()
	monster.global_position = Global.player.global_position + (
		Vector2(400, -400)
	)
	add_child(monster)
