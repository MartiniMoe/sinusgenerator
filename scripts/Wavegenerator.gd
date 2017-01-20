extends Node2D

var wave = preload("res://scenes/Wave.tscn")

# leave this... it is needed to be 0 for the first child wave :D
var current_x = 0
var current_y = 0

var amplitudeArray = [100, 50, 25, 10]
var frequencyArray = [100, 180, 230, 390]
var colorArray = [Color(0, 0, 0), Color(1, 1, 1), Color(1, 0, 0), Color(0, 1, 0)]

func _ready():
	set_fixed_process(true)
	
	# add child waves
	var last_added_child = self
	for i in range(amplitudeArray.size()):
		var new_wave = wave.instance()
		new_wave.set_name("wave" + str(i))
		new_wave.set_vars(amplitudeArray[i], frequencyArray[i], colorArray[i])
		# add wave as child to last added wave
		last_added_child.add_child(new_wave)
		last_added_child = new_wave
	
	gamemanager.get_waves()