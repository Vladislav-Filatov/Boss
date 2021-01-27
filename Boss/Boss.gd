extends Area2D


#move
#shooting
#spawn
onready var timer= $teleportimer
onready var firingPositions := $firingPositions
onready var fireDelayTimer := $fireDelayTimer
export var fireDelay := 0.1

var BulletBoss:= preload("res://BulletBoss/BulletBoss.tscn")

var vel = Vector2()
var life = 250
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
		timer.start(1)
	position = vel
	if life ==0:
		kill()
		
func shoot():
	if fireDelayTimer.is_stopped(): 
		fireDelayTimer.start(fireDelay)
		for child in firingPositions.get_children():
			var bullet = BulletBoss.instance()
			bullet.global_position = child.global_position
			get_tree().current_scene.add_child(bullet)

func kill():
	queue_free()
	
