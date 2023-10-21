extends Node2D

var initialOrbs = 100
var Orb = preload("res://Orb.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	for n in initialOrbs:
		var orbTemp = Orb.instantiate()
		var rng = RandomNumberGenerator.new()
		var ranX = rng.randi_range(-500, 500)
		var ranY = rng.randi_range(-500, 500)
		orbTemp.position = Vector2(ranX, ranY)
		add_child(orbTemp)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
