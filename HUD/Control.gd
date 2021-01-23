extends Control

var pLifeIcon := preload("res://HUD/LifeIcon.tscn")

onready var lifeContainer := $LifeContainer
onready var scoreLabel := $Score

var score: int = 0

func _ready():
	clearLives()
	
func clearLives():
	for child in lifeContainer.get_children():
		lifeContainer.remove_child(child)
		child.queue_free()

func setLives(lives: int):
	clearLives()
	for i in range(lives):
		lifeContainer.add_child(pLifeIcon.instance())

func _on_score_increment(amount: int):
	score += amount
	scoreLabel.text = str(score)

func _on_Player_player_life_changed(life):
	setLives(life)
