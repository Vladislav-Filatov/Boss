extends Area2D


#move
#shooting
#spawn
onready var timer= $teleportimer
var vel = Vector2()
<<<<<<< Updated upstream
var life = 250
=======
var life = 100
>>>>>>> Stashed changes
func _ready():
	pass
func _physics_process(delta):
	if timer.is_stopped():
		var rand = RandomNumberGenerator.new()
		rand.randomize()
		vel.x = rand.randi_range(50, 400)
		
		var rand1 = RandomNumberGenerator.new()
		rand1.randomize()
		vel.y = rand1.randi_range(50, 300)
		timer.start(10)
	position = vel
	if life ==0:
		kill()
func shoot():
	pass 

func kill():
	queue_free()
	
