extends CharacterBody2D

const G = 1000
var mass

# Called when the node enters the scene tree for the first time.
func _ready():
	var rng = RandomNumberGenerator.new()
	velocity.x = rng.randi_range(-1, 1)
	velocity.y = rng.randi_range(-1, 1)
	mass = 1 #rng.randi_range(1,2)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move_and_slide()
	var orbs = get_node("/root/Main/Orbs").get_children()
	gravitate(orbs)
	
func gravitate(orbs):
	const gravitationalConstant = 1
	var acceleration = find_acceleration(orbs)
	
	self.velocity.x = self.velocity.x + acceleration.x
	self.velocity.y = self.velocity.y + acceleration.y

func distance(anOrb):
	var distance = sqrt(pow((anOrb.position.x-self.position.x),2)+pow((anOrb.position.y-self.position.y),2))
	return distance

func find_acceleration(orbs):
	var acceleration = Vector2(0,0)
	for orb in orbs:
		if orb == self:
			pass
		else:
			var distance = distance(orb)
			var newVectorX = orb.mass*(orb.position.x-self.position.x)/(pow(distance,3))
			acceleration.x += G*self.mass*newVectorX
			
			var newVectorY = orb.mass*(orb.position.y-self.position.y)/(pow(distance,3))
			acceleration.y += G*self.mass*newVectorY
	return acceleration
