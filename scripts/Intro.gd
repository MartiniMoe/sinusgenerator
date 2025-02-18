extends Node2D

var menuScene = preload("res://scenes/Menu.tscn")
var number = 0

func _ready():
	get_node("AnimationPlayer").play("tutorial")
	
	var wave_info = get_node("WaveInfo")
	var gui = get_node("/root/Main/Gui")
	
	# debug
	gui.get_node("Wave1/Slider1f").set_value(wave_info.freq1)
	gui.get_node("Wave2/Slider2f").set_value(wave_info.freq2)
	gui.get_node("Wave3/Slider3f").set_value(wave_info.freq3)
	gui.get_node("Wave4/Slider4f").set_value(wave_info.freq4)
	
	gui.get_node("Wave1/Slider1a").set_value(wave_info.amp1)
	gui.get_node("Wave2/Slider2a").set_value(wave_info.amp2)
	gui.get_node("Wave3/Slider3a").set_value(wave_info.amp3)
	gui.get_node("Wave4/Slider4a").set_value(wave_info.amp4)
		
	gui.get_node("Wave1/Slider1p").set_value(wave_info.phase1)
	gui.get_node("Wave2/Slider2p").set_value(wave_info.phase2)
	gui.get_node("Wave3/Slider3p").set_value(wave_info.phase3)
	gui.get_node("Wave4/Slider4p").set_value(wave_info.phase4)
	
	for node in get_children():
		if "obstacle" in node.get_groups():
			node.freqs[0] = wave_info.freq1
			node.freqs[1] = wave_info.freq2
			node.freqs[2] = wave_info.freq3
			node.freqs[3] = wave_info.freq4
			
			node.phases[0] = wave_info.phase1
			node.phases[1] = wave_info.phase2
			node.phases[2] = wave_info.phase3
			node.phases[3] = wave_info.phase4
			
			node.amps[0] = wave_info.amp1
			node.amps[1] = wave_info.amp2
			node.amps[2] = wave_info.amp3
			node.amps[3] = wave_info.amp4

func reset_level():
	var gui = get_node("/root/Main/Gui")
	gui.get_node("Wave1Locked").hide()
	gui.get_node("Wave2Locked").hide()
	gui.get_node("Wave3Locked").hide()
	gui.get_node("Wave4Locked").hide()

func returnToMenu():
	var root = get_tree().get_root()
	var current_scene = root.get_child(root.get_child_count() -1)
	current_scene.queue_free()
	
	var menuSceneInstance = menuScene.instance()
	root.add_child(menuSceneInstance)