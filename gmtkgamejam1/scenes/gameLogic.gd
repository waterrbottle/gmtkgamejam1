extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$CharacterBody2D.position = Vector2(10000,-500)
	$RigidBody2D.position = Vector2(10000,-1000)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$CanvasLayer/Label.text = "altitude: " + str(floor((Global.playerpos.y * -10))/1000 + -1)
