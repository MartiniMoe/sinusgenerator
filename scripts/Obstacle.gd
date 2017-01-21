extends Node2D

var freqs = [ 0.0, 0.0, 0.0, 0.0 ]
var phases = [ 0.0, 0.0, 0.0, 0.0 ]
var amps = [ 0.0, 0.0, 0.0, 0.0 ]

var base_pos = Vector2(0.0, 0.0)
var t = 0.0
var wavegen

func _ready():
	wavegen=gamemanager.wavegenerator
	base_pos = self.get_pos() - Vector2(wavegen.wave_start*2,0)
	print(base_pos.x)
	set_fixed_process(true)

func _fixed_process(delta):
	t += delta / 100
	
	var pos_y = 0.0
	var pi=3.1416
	
	var factor=2*pi/(wavegen.wave_shader_size.x*wavegen.wl_factor)

	for i in range(4):
		pos_y += amps[i] * cos( freqs[i] * (t - factor * base_pos.x) + phases[i])
	
	self.set_pos(Vector2(base_pos.x+wavegen.wave_start*2, base_pos.y + pos_y))
