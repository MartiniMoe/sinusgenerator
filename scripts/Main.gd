extends Node2D

var currentLevel

func _ready():
	get_node("LevelAnimationPlayer").play("Flickering")

func loadLevel(path):
	currentLevel = load(path).instance()
	add_child(currentLevel)
	currentLevel.reset_level()
	get_node("Level").set_text("Stage " + str(currentLevel.number))

func nextLevel():
	var nextLevelNumber = currentLevel.number + 1
	remove_child(currentLevel)
	loadLevel("res://scenes/Level%02d.tscn" % nextLevelNumber)

func _on_NextLevelButton_pressed():
	nextLevel()
