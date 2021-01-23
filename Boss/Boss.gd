extends Area2D


#move
#shooting
#spawn
var speed = 0

func _ready():
	var rand = RandomNumberGenerator.new()
	rand.randomize()
	speed = rand.randf_range(50, 400)

func _physics_process(delta):
	pass
	
func shoot():
	pass 
	
