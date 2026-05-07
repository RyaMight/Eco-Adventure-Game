extends Area2D
@export_enum("organik", "anorganik", "b3") var jenis_sampah: String = "organik"
func _ready():
	
	add_to_group("sampah")
	
	# Cari node ColorRect secara manual
	var visual = get_node_or_null("ColorRect")
	
	if visual != null:
		match jenis_sampah:
			"organik": visual.color = Color.GREEN
			"anorganik": visual.color = Color.BLUE
			"b3": visual.color = Color.RED
	else:
		print("Woi, node ColorRect belum ada di scene Sampah!")
