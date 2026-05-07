extends CharacterBody2D

var speed = 10
var sampah_chase = false
var player = null
var health = 10
var sampah_alive = true

func _physics_process(delta):
	if sampah_chase and player != null:
		position += (player.position - position) / speed
	if health <= 0 and sampah_alive:
		die()

func organik():
	pass

func _on_detect_body_entered(body: Node2D) -> void:
	if body.name == "Player" or body.is_in_group("player"):
		player = body
		sampah_chase = true

func _on_detect_body_exited(body: Node2D) -> void:
	if body == player:
		player = null
		sampah_chase = false

func take_damage(amount):
	if not sampah_alive:
		return
	health -= amount
	print("Sampah kena damage, health sisa:", health)
	if health <= 0:
		die()

func die():
	if sampah_alive:
		sampah_alive = false
		Global.skor += 10
		print("Sampah hancur!")
		queue_free()

func _ready():
	add_to_group("sampah_anorganik")
