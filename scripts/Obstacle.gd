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
	set_fixed_process(true)
	
func eval_wave(pos_x):
	var pos_y = 0.0
	var pi=3.1416
	
	var factor=2*pi/(wavegen.wl_factor)

	for i in range(4):
		pos_y += amps[i] * cos( freqs[i] * (t - factor *pos_x) + phases[i])

	return pos_y

func _fixed_process(delta):
	t += delta / 100
	
	var pos_y = eval_wave(base_pos.x)
	
	var rect=get_child(0).get_texture().get_data().get_used_rect().grow(get_child(0).get_scale().x)
	
	var eval_point=Vector2(get_pos().x,eval_wave(get_pos().x))
	#var eval1=eval_wave(rect.pos.x)
	#var eval2=eval_wave(rect.end.x)
	
	#if rect.has_point(eval_point):
	if rect.has_point(get_viewport().get_mouse_pos()):
		print("collision")
	
	self.set_pos(Vector2(base_pos.x+wavegen.wave_start*2, base_pos.y + pos_y))
