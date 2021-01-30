extends Area2D
class_name Player

var plBullet := preload("res://Bullet/Bullet.tscn")


onready var firingPositions := $FiringPositions
onready var fireDelayTimer := $FireDelayTimer
onready var sprite := $Sprite
onready var music := $AudioStreamPlayer2D


var score = 0
var speed: float = 150
var life: int = 3
var vel := Vector2(0, 0)


export var fireDelay := 0.1
signal player_life_changed(life)

func _ready():
	emit_signal("player_life_changed", life)

func _process(delta):
	if vel.x < 0:
		sprite.frame = 0
	elif vel.x > 0:
		sprite.frame = 2
	else : 
		sprite.frame = 1
	
	if Input.is_action_pressed("player_shoot") and fireDelayTimer.is_stopped(): 
		music.play()
		fireDelayTimer.start(fireDelay)
		for child in firingPositions.get_children():
			var bullet = plBullet.instance()
			bullet.global_position = child.global_position
			get_tree().current_scene.add_child(bullet)
		
		
			
func _physics_process(delta):
	var dirVec := Vector2(0, 0)
	if Input.is_action_pressed("player_left"):
		dirVec.x = -1
	elif Input.is_action_pressed("player_right"):
		dirVec.x = 1
	if Input.is_action_pressed("player_up"):
		dirVec.y = -1
	elif Input.is_action_pressed("player_down"):
		dirVec.y = 1

	vel = dirVec.normalized() * speed
	position += vel * delta
	
	var viewRect := get_viewport_rect()
	position.x = clamp(position.x, 0, viewRect.size.x)
	position.y = clamp(position.y, 0, viewRect.size.y)
	
	if life == 0:
		kill()
func damage(amount: int):
	life -= amount
	emit_signal("player_life_changed", life)
	
func kill():
	get_tree().reload_current_scene()

