extends Area2D

var pMeteorEffect := preload("res://Meteor/MeteorEffect.tscn")

var minSpeed: float = 30
var maxSpeed: float = 60
var minRotationRate: float = -30
var maxRotationRate: float = 30

var life: int = 10

var speed: float = 0
var rotationRate: float = 0

func _ready():
	speed = rand_range(minSpeed, maxSpeed)
	rotationRate = rand_range(minRotationRate, maxRotationRate)

func _physics_process(delta):
	rotation_degrees += rotationRate * delta
	
	position.y += speed * delta
	
func damage(amount: int):
	if life <= 0: 
		return
	life -= amount 
	if life <= 0:
		
		var effect = pMeteorEffect.instance()
		effect.position = position
		get_parent().add_child(effect)
		
		queue_free()

func _on_VisibilityNotifier2D_screen_exit():
	queue_free()


func _on_area_entered(area):
	if area.is_in_group("player"):
		area.damage(1)
		queue_free()
