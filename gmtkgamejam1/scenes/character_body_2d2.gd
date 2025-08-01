extends CharacterBody2D
var air = [false,0]

const SPEED = 1000.0
const JUMP_VELOCITY = -1000.0


func _physics_process(delta: float) -> void:
	if air[0] == true:

		$Camera2D.zoom = Vector2(1+(position.y-air[1])/3500,1+(position.y-air[1])/3500)
		if $Camera2D.zoom.x < 0.3:
			$Camera2D.zoom = Vector2(0.3,0.3)
		
	else:
		$Camera2D.zoom = Vector2(1,1)
	Global.playerpos = position
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity()*2 * delta

		
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	var push_force = 30.0

	# after calling move_and_slide()
	for i in get_slide_collision_count():
		var c = get_slide_collision(i)
		if c.get_collider() is RigidBody2D:
			c.get_collider().apply_central_impulse(-c.get_normal() * push_force)
	
	if is_on_floor():
		if air[0] == true:
			var tween = get_tree().create_tween()
			#tween.tween_property($Camera2D, "modulate", Color.RED, 1)
			tween.tween_property($Camera2D, "zoom", Vector2(1,1), 0.5)
			#tween.tween_callback($Camera2D.queue_free)
			air[0] = false
