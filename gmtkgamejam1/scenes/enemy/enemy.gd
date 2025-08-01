extends CharacterBody2D
var die = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if die == false:
		look_at(Global.playerpos)

		velocity += Vector2(10,0).rotated(rotation)
		if velocity.length() > 1000:
			velocity /= 1.5
		move_and_slide()
	else:
		velocity += get_gravity()*2 * delta
		velocity.x /=1.5
		move_and_slide()
	


func _on_area_2d_body_entered(body: Node2D) -> void:
	if die == false:
		if body.is_in_group("player"):
			if body.air[0] == false:
				body.air[1] = body.position.y
				body.air[0] = true
				$cooldown.start()
				$CollisionShape2D.disabled = true
			body.velocity.y = -2000
	
func diepls():
	$dietimer.start()
	print("die")

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "die":
		queue_free()


func _on_dietimer_timeout() -> void:
	$AnimationPlayer.play("die")


func _on_cooldown_timeout() -> void:
	$CollisionShape2D.disabled = false
