extends Control

var mainScene = preload("res://scenes/Main.tscn")

func _ready():
	pass

func changeToScene(path):
	var root = get_tree().get_root()
	var current_scene = root.get_child(root.get_child_count() -1)
	current_scene.queue_free()
	
	var mainSceneInstance = mainScene.instance()
	root.add_child(mainSceneInstance)
	mainSceneInstance.loadLevel(path)

func _on_btnExit_pressed():
	get_tree().quit()

func _on_btnStartGame_pressed():
	# Start game
	changeToScene("res://scenes/Level01.tscn")

func _on_btnTutorial_pressed():
	# Start tutorial
	changeToScene("res://scenes/Intro.tscn")