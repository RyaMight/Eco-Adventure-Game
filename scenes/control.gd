extends Control



func _on_button_pressed() -> void:
	print("Start Button Pressed")
	Global.skor = 0
	get_tree().change_scene_to_file("res://scenes/world.tscn")


func _on_button_2_pressed() -> void:
	print("Exit Button Pressed")
	get_tree().quit();
