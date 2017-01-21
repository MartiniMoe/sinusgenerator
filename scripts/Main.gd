extends Node2D

var currentLevel

func _ready():
	pass

func loadLevel(path):
	currentLevel = load(path).instance()
	add_child(currentLevel)
	#get_node("Gui").set_gui_waves()