extends Node2D

var currentLevel

func _ready():
	pass

func loadLevel(path):
	currentLevel = load(path).instance()
	add_child(currentLevel)

func nextLevel():
	var nextLevelNumber = currentLevel.number + 1
	remove_child(currentLevel)
	loadLevel("res://scenes/Level%02d.tscn" % nextLevelNumber)

func _on_NextLevelButton_pressed():
	nextLevel()
