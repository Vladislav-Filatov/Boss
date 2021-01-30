extends Area2D
class_name Boss
#move+
#shooting+
#spawn

onready var timer= $teleportimer
onready var firingPositions := $firingPositions
onready var fireDelayTimer := $fireDelayTimer
export var fireDelay := 1

var BulletBoss:= preload("res://BulletBoss2/BulletBoss2.tscn")

var vel = Vector2()
var life = 1000
func _ready():
	pass
	
func _physics_process(delta):
	print(life)
	if timer.is_stopped():
		var rand = RandomNumberGenerator.new()
		rand.randomize()
		vel.x = rand.randi_range(50, 400)
		var rand1 = RandomNumberGenerator.new()
		rand1.randomize()
		vel.y = rand1.randi_range(50, 300)
		timer.start(1.3)
	position = vel
	if life ==0:
		kill()
	shoot()

		
func shoot():
	if fireDelayTimer.is_stopped(): 
		fireDelayTimer.start(fireDelay)
		for child in firingPositions.get_children():
			var bullet = BulletBoss.instance()
			bullet.global_position = child.global_position
			get_tree().current_scene.add_child(bullet)


func damage(amount: int):
	life -= amount
	emit_signal("player_life_changed", life)

func kill():
	queue_free()
	
