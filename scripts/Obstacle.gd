extends Node2D

var freqs = [ 1.0, 1.0, 1.0, 1.0 ]
var phases = [ 0.0, 0.0, 0.0, 0.0 ]
var amps = [ 1.0, 1.0, 1.0, 1.0 ]

var base_pos = Vector2(0.0, 0.0)
var t = 0.0

func _ready():
	base_pos = self.get_global_pos()
	set_fixed_process(true)

func _fixed_process(delta):
	t += delta / 100
	
	var pos_y = 0.0
	var factor = 0.0000625
	var time_offset = 1.75
	for i in range(4):
		#pos_y += -0.75 * amps[i] * sin(0.01 * freqs[i] * (t + time_offset) + phases[i] - factor * base_pos.x * freqs[i])
		#pos_y += amps[i] * sin(0.7 + freqs[i] * t + phases[i] - factor * base_pos.x * freqs[i])
		pos_y += amps[i] * sin((t - factor * base_pos.x) * freqs[i] + phases[i] - 0.7)
	
	self.set_global_pos(Vector2(base_pos.x, base_pos.y + pos_y))