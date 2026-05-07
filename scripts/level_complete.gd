extends Control

func _on_next_level_pressed():
	get_tree().change_scene_to_file("res://scenes/coming_soon.tscn")

func _on_restart_pressed():
	Global.skor = 0
	get_tree().change_scene_to_file("res://scenes/world.tscn")


func _on_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/control.tscn")
