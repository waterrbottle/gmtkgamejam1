extends VBoxContainer

var upgrades = ["Strength", "Speed", "Jump Height", "Faster Arrow Reload",
 "Ambrosia Magnet", "Stronger Arrows", "Piercing", "Luck"]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
func reroll():
	$Button.text = upgrades[randi_range(0,upgrades.size()-1)]
	$Button2.text = upgrades[randi_range(0,upgrades.size()-1)]
	$Button3.text = upgrades[randi_range(0,upgrades.size()-1)]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
