extends Control


func _ready() -> void:
	pass
func _on_start_pressed() -> void:
	$ColorRect2.show()
	$Timer2.start()
	

func _on_settings_pressed() -> void:
	pass # Replace with function body.

func _on_exit_pressed() -> void:
	get_tree().quit()


func _on_timer_timeout() -> void:

	$ColorRect/fadeout.play("fadeout")


func _on_fadeout_animation_finished(anim_name: StringName) -> void:
	if $ColorRect != null:
		$ColorRect.queue_free()


func _on_timer_2_timeout() -> void:
	get_tree().change_scene_to_file("res://scenes/tralarelotrarala.tscn")


func _on_button_pressed() -> void:
	pass # Replace with function body.


func _on_button_2_pressed() -> void:
	pass # Replace with function body.


func _on_button_3_pressed() -> void:
	pass # Replace with function body.


func _on_timer_3_timeout() -> void:
	$ColorRect/Label2.hide()
	$ColorRect/Label.show()
