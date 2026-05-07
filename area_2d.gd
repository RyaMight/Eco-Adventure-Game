extends Area2D

@export_enum("organik", "anorganik", "b3") var jenis_sampah: String = "organik"
var player = null
var nempel = false

func _ready():
	add_to_group("sampah")

func _process(_delta):
	if player and !nempel:
		# Jika jarak kurang dari 20 pixel, anggap nempel
		if position.distance_to(player.position) < 20:
			nempel = true
	
	if nempel:
		# Ikuti posisi player dengan sedikit offset (misal di atas kepala)
		position = player.position + Vector2(0, -25)

func _on_body_entered(body):
	if body.name == "player": # Pastikan nama node player kamu 'player'
		player = body
