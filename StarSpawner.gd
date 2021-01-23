extends Node2D


var starSmall := preload("res://StarSmall.tscn")
var starBig := preload("res://StarBig.tscn")

onready var starTimer := $StarTimer
onready var screen_size = get_viewport().get_visible_rect().size 

export var spawnDelay := 0.5

func _process(delta):
	if starTimer.is_stopped():
		starTimer.start(spawnDelay)
		_spawn()


func _spawn():
	var rand1 = RandomNumberGenerator.new()
	var rand2 = RandomNumberGenerator.new()
	
	rand2.randomize() ##
	var star = starBig.instance()
	if (rand2.randi() % 2 == 0): ##
		star = starSmall.instance()		
	rand1.randomize()
	var x = rand1.randf_range(0, screen_size.x)
	var y = -100
	star.position.y = y
	star.position.x = x
	add_child(star)
		

