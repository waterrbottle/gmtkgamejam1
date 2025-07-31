extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var seq = []
var index = 0
func _physics_process(delta: float) -> void:
	
	
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity()/4 * delta

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


func _on_timer_timeout() -> void:
	if index > get_parent().seq.size()-1:
		index = 0
	if get_parent().seq[index] == "up":
		velocity.y = -800
	if get_parent().seq[index]== "left":
		velocity.x = -2000
	if get_parent().seq[ index] == "right":
		velocity.x = 2000
	print(index)
	index += 1
	
