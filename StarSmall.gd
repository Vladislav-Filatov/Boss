extends Node2D


export var speed: float = 500

func _ready():
	var rand = RandomNumberGenerator.new()
	rand.randomize()
	speed = rand.randf_range(100,1000)

func _physics_process(delta):
	position.y += speed * delta


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
