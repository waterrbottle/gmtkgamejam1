extends Node2D
var seq = []


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$CanvasLayer/Label.text = str(seq)


func _on_left_pressed() -> void:
	seq.append("left")


func _on_right_pressed() -> void:
	seq.append("right")


func _on_up_pressed() -> void:
	seq.append("up")


func _on_go_pressed() -> void:
	$Timer.start()
