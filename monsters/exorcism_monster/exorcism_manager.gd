class_name ExManager
extends Manager

var objects : Array[Obj]
var non_haunt_obj : Array[Obj]
@export var haunt_amount : int = 3
@export var holy_water : int = 4


func start():
	phantom.queue_free()
	objects.assign(get_tree().get_nodes_in_group("obj"))
	for i in objects:
		i.start()
	non_haunt_obj.assign(objects)
	for i in haunt_amount:
		var choose := non_haunt_obj.pick_random() as Obj
		choose.haunt()
		non_haunt_obj.erase(choose)
