extends StaticBody2D

var tarik_radius = 40

func _physics_process(delta):
	var semua_sampah = get_tree().get_nodes_in_group("sampah_b_3")
	for sampah in semua_sampah:
		var jarak = position.distance_to(sampah.position)
		if jarak < tarik_radius:
			sampah.position += (position - sampah.position) * delta * 3
			if jarak < 10:
				sampah.take_damage(10)
