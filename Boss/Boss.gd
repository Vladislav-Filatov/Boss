extends Area2D


#move
#shooting
#spawn


func _ready():
	var speed = Vector2()
	var rand = RandomNumberGenerator.new()
	rand.randomize()
	speed = rand.randf_range(50, 400)

func _physics_process(delta):
	pass
