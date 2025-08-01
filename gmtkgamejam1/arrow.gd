extends CharacterBody2D

var dead = false
func _physics_process(delta: float) -> void:
	velocity += get_gravity()*2 * delta
	rotation = velocity.angle()
	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("ground"):
		print("arrow entered ground")
		dead = true
		#var tween = get_tree().create_tween()
		#tween.tween_property($Camera2D, "modulate", Color.RED, 1)
		#tween.tween_property(self, "rotation", 90, 0.5, )
		
		velocity.x = 0
	if body.is_in_group("enemy"):
		if dead == false:
			if body.die == true:
				body.velocity = velocity
			if body.die == false:
				body.diepls()
				body.die = true
				queue_free()
		
			


func _on_timer_timeout() -> void:
	$AnimationPlayer.play("new_animation")


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	queue_free()
