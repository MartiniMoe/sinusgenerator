extends Node2D

export var number = 0
var numCollidingObstacles = 0
var winTimer = 0
var timeToWin = 3
var won = false
var debug = true

func _ready():
	set_fixed_process(true)

func _fixed_process(delta):
	if !won && numCollidingObstacles == 0:
		winTimer += delta
		get_node("Goal/ProgressBar").set_value((winTimer/timeToWin) * 100)
		if winTimer > timeToWin:
			# WINWIN
			won = true
			get_node("/root/Main/CompleteAnimationPlayer").play("complete")
			#get_node("/root/Main/NextLevelButtonContainer").show()
	else:
		winTimer = 0
		get_node("Goal/ProgressBar").set_value(0)

func reset_level():
	var wave_info = get_node("WaveInfo")
	var gui = get_node("/root/Main/Gui")
	
	# debug
	if debug:
		gui.get_node("Wave1/Slider1f").set_value(wave_info.freq1)
		gamemanager.wave1.set_freq(wave_info.freq1)
		gui.get_node("Wave2/Slider2f").set_value(wave_info.freq2)
		gamemanager.wave2.set_freq(wave_info.freq2)
		gui.get_node("Wave3/Slider3f").set_value(wave_info.freq3)
		gamemanager.wave3.set_freq(wave_info.freq3)
		gui.get_node("Wave4/Slider4f").set_value(wave_info.freq4)
		gamemanager.wave4.set_freq(wave_info.freq4)
		
		gui.get_node("Wave1/Slider1a").set_value(wave_info.amp1)
		gamemanager.wave1.set_amp(wave_info.amp1)
		gui.get_node("Wave2/Slider2a").set_value(wave_info.amp2)
		gamemanager.wave2.set_amp(wave_info.amp2)
		gui.get_node("Wave3/Slider3a").set_value(wave_info.amp3)
		gamemanager.wave3.set_amp(wave_info.amp3)
		gui.get_node("Wave4/Slider4a").set_value(wave_info.amp4)
		gamemanager.wave4.set_amp(wave_info.amp4)
			
		gui.get_node("Wave1/Slider1p").set_value(wave_info.phase1)
		gamemanager.wave1.set_phase(wave_info.phase1)
		gui.get_node("Wave2/Slider2p").set_value(wave_info.phase2)
		gamemanager.wave2.set_phase(wave_info.phase2)
		gui.get_node("Wave3/Slider3p").set_value(wave_info.phase3)
		gamemanager.wave3.set_phase(wave_info.phase3)
		gui.get_node("Wave4/Slider4p").set_value(wave_info.phase4)
		gamemanager.wave4.set_phase(wave_info.phase4)
	
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
	
	if wave_info.difficulty < 1:
		gui.get_node("Wave1").hide()
		gui.get_node("Wave1Locked").show()
	else:
		gui.get_node("Wave1").show()
		gui.get_node("Wave1Locked").hide()
	
	if wave_info.difficulty < 2:
		gui.get_node("Wave2").hide()
		gui.get_node("Wave2Locked").show()
	else:
		gui.get_node("Wave2").show()
		gui.get_node("Wave2Locked").hide()
	
	if wave_info.difficulty < 3:
		gui.get_node("Wave3").hide()
		gui.get_node("Wave3Locked").show()
	else:
		gui.get_node("Wave3").show()
		gui.get_node("Wave3Locked").hide()
	
	if wave_info.difficulty < 4:
		gui.get_node("Wave4").hide()
		gui.get_node("Wave4Locked").show()
	else:
		gui.get_node("Wave4").show()
		gui.get_node("Wave4Locked").hide()