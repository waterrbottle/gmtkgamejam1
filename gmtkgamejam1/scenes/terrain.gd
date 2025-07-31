@tool
extends StaticBody2D

@export_tool_button("make terrain!")
var button = do_stuff
var gensize = 1000
var memory = []
# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	
	do_stuff()

func do_stuff():
	var gencurve = Curve2D.new()
	gencurve.bake_interval = 200
	for i in range(gensize):
		var randi = randf_range(100,200)
		
		gencurve.add_point(Vector2(i*200, randi - (i*i)/10))
		memory.append(randi - (i*i)/10)

	for i in range(gensize):
		gencurve.add_point(Vector2(-200+gensize*200-i*200, memory[memory.size()-i-1]+ 1000 ))
	#gencurve.add_point(Vector2(gensize*200,0))
	#gencurve.add_point(Vector2(0,500))
	#gencurve.add_point(Vector2(600,600))
	#gencurve.add_point(Vector2(600,100))
		
	


	$Path2D.set_curve(gencurve)
	print("hi")
	var curve = $Path2D.curve
	var polygon = curve.get_baked_points()
	$Polygon2D.polygon = polygon
	$CollisionPolygon2D.polygon = polygon
	$Line2D.points = polygon

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
