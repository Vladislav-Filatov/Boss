extends Node2D

var bosstimer = false
var meteor := preload("res://Meteor/Meteor.tscn")
var boss = preload("res://Boss/Boss.tscn")
var life1 =  30
var lll = 0
onready var spawntimerboss = $bosstimer


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
	
	
	

func _process(delta):
	if spawntimerboss.is_stopped() and !bosstimer:
		bossspawn()
		spawntimerboss.stop()
	
	for child in get_children():
		if child is Boss:
			life1 = child.get_life()
			
	print(life1)
	
	if get_node("Boss") == null and lll == 1:
		get_node("deathboss").visible = true
		$KPACABAtimer.start(10)
		lll +=1
	
	if $KPACABAtimer.is_stopped():
		get_node("deathboss").visible = false
	
	
func bossspawn():
	add_child(boss.instance())
	bosstimer = true
	lll = 1
