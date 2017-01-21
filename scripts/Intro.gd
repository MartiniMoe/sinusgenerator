extends Node2D

var menuScene = preload("res://scenes/Menu.tscn")

func _ready():
	get_node("AnimationPlayer").play("tutorial")

func returnToMenu():
	var root = get_tree().get_root()
	var current_scene = root.get_child(root.get_child_count() -1)
	current_scene.queue_free()
	
	var menuSceneInstance = menuScene.instance()
	root.add_child(menuSceneInstance)