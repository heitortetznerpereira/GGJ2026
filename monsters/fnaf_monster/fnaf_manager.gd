class_name FNAFManager
extends Manager


@export var change_timer : Timer
@export var change_time : float = 5
@export_range(0, 1, 0.1) var move_chance : float = 0.5
@onready var laugh : AudioStream = load(
	"res://assets/sound/evil_laugh.wav"
)

var windows : Array[GWindow]
var curr_window : GWindow
@export var time : float = 300
var started := false


func _ready() -> void:
	windows.assign(get_tree().get_nodes_in_group("window"))
	change_timer.wait_time = change_time
	change_timer.timeout.connect(try_move)
	Global.audio.stream = laugh
	Global.audio.pitch_scale = 2


func start():
	started = true
	Global.player.show_windows()
	phantom.queue_free()
	for w in windows:
		w.start()
	change_timer.start()


func try_move():
	var rng := randf()
	if move_chance > rng:
		atk_window()


func atk_window():
	Global.audio.play()
	if curr_window:
		if curr_window.state != GWindow.states.BOARD:
			monster = monster_scene.instantiate()
			monster.global_position = (
				curr_window.global_position
			)
			add_child(monster)
			return
		curr_window.clear()
	curr_window = windows.pick_random() as GWindow
	curr_window.danger()


func win():
	Global.player.hide_windows()
	for w in windows:
		w.clear()
		w.change_state(GWindow.states.NORMAL)
		w.stop()
	change_timer.stop()
	if monster:
		monster.queue_free()
	Global.map.win()

func _process(delta: float) -> void:
	if started:
		time -= delta
		Global.player.w_time = time
		if time <= 0:
			win()
			started = false
