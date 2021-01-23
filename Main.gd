extends Node2D

var meteor := preload("res://Meteor/Meteor.tscn")


func _ready():
	var screen_size = get_viewport().get_visible_rect().size 
	var rand = RandomNumberGenerator.new()

	var enemy = meteor.instance()
	rand.randomize()
	var x = rand.randf_range(0, screen_size.x)
	var y = -100
	enemy.position.y = y
	enemy.position.x = x
	add_child(enemy)
