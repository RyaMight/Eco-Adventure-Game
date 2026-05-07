extends Node2D

@onready var skor_label = $CanvasLayer/SkorLabel

@export var sampah_organik_scene : PackedScene
@export var sampah_anorganik_scene : PackedScene
@export var sampah_b3_scene : PackedScene

var spawn_interval = 10.0

func _ready() -> void:
	var timer = Timer.new()
	add_child(timer)
	timer.wait_time = spawn_interval
	timer.autostart = true
	timer.timeout.connect(_spawn_sampah)
	timer.start()

func _process(delta):
	change_scene()
	skor_label.text = "Score: " + str(Global.skor)
	
	if Global.skor >= 50:
		get_tree().change_scene_to_file("res://scenes/level_complete.tscn")

func _spawn_sampah():
	var scenes = [sampah_organik_scene, sampah_anorganik_scene, sampah_b3_scene]
	scenes = scenes.filter(func(s): return s != null)
	if scenes.is_empty():
		print("ERROR: Assign scene sampah dulu di Inspector!")
		return
	
	var random_scene = scenes[randi() % scenes.size()]
	var random_x = randf_range(0, 400)
	var random_y = randf_range(0, 192)
	
	var sampah = random_scene.instantiate()
	sampah.position = Vector2(random_x, random_y)
	add_child(sampah)
	print("Spawn sampah di:", sampah.position)

func _on_cliffside_transition_body_entered(body):
	print("Objek masuk: ", body.name)
	if body.has_method("player") or body.name == "player":
		print("PLAYER TERDETEKSI! Mencoba pindah scene...")
		Global.transition_scene = true
	else:
		print("Diabaikan: Ini bukan player.")

func _on_cliffside_transition_body_exited(body):
	if body.has_method("player"):
		Global.transition_scene = false

func change_scene():
	if Global.transition_scene == true:
		if Global.current_scene == "world":
			get_tree().change_scene_to_file("res://scenes/cliff_side.tscn")
			Global.finish_changescenes()
