extends Node2D
var collectable = load("res://scenes/collectable/collectable.tscn")
var enemy = load("res://scenes/enemy/enemy.tscn")
var arrow = load("res://scenes/arrow/arrow.tscn")
var limit = 5
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$CharacterBody2D.position = Vector2(10000,-5000)
	$RigidBody2D.position = Vector2(10000,-5000)
	var sep = 0.5
	for i in range(10000):
		var inst = collectable.instantiate()
		inst.position = Vector2(200/sep*i+randf_range(-5000,500), (-i*i*2/8/(sep*sep)-100+randf_range(-700,100)))
		$points.add_child(inst)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$ui/altitudelabel.text = "altitude: " + str(floor((Global.playerpos.y / -100))/10 + 0)
	$ui/distancelabel.text = "distance: " + str(floor((Global.playerpos.x / 100))/10 - 10)
	$ui/moneylabel.text = "money: " +str(Global.money)
	$Timer.wait_time=  7- (floor((Global.playerpos.y / -100))/10 + 0)/ 8
	if $Timer.wait_time < 1:
		$Timer.wait_time = 1
	if Input.is_action_just_pressed("click"):
		var inst = arrow.instantiate()
		inst.position =  Global.playerpos
		inst.velocity = (get_global_mouse_position()-Global.playerpos).normalized() * 2000 + Vector2(0,-100) +$CharacterBody2D.velocity
		print((get_global_mouse_position()-Global.playerpos).normalized() )
		add_child(inst)
	
	$ui/ProgressBar.max_value = limit
	$ui/ProgressBar.value = Global.money
	
	var fillval = (Global.money*1.0/limit)*170
	$ui/vase/TextureRect2/filler.size.y = fillval

	$ui/vase/TextureRect2/filler.position.y = 170 - fillval
	if Global.money >= limit:
		$ui/upgrades.reroll()
		Global.money -= limit
		limit += 3


func _on_timer_timeout() -> void:
	var inst = enemy.instantiate()
	inst.position = Global.playerpos + Vector2(0,-1000)
	add_child(inst)
