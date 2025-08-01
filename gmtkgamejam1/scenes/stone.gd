extends RigidBody2D


func _on_body_entered(body: Node) -> void:
	if body.is_in_group("ground"):
		$AudioStreamPlayer2D.stop()

func _on_body_exited(body: Node) -> void:
	if body.is_in_group("ground"):
		$AudioStreamPlayer2D.play()
