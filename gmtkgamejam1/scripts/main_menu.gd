extends Control

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/tralarelotrarala.tscn")

func _on_settings_pressed() -> void:
	pass # Replace with function body.

func _on_exit_pressed() -> void:
	get_tree().quit()
