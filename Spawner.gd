extends Node2D

var meteor := preload("res://Meteor/Meteor.tscn")

onready var screen_size = get_viewport().get_visible_rect().size 
onready var spawnTimer = $SpawnTimer

export var spawnDelay := 1

func _process(delta):
	if spawnTimer.is_stopped():
		spawnTimer.start(spawnDelay)
		_spawn()


func _spawn():
	var rand = RandomNumberGenerator.new()
	var enemy = meteor.instance()
	rand.randomize()
	var x = rand.randf_range(0, screen_size.x)
	var y = -100
	enemy.position.y = y
	enemy.position.x = x
	add_child(enemy)
