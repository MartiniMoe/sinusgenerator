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

func eval_wave(pos_x,freqs,phases,amps):
	var pos_y = 0.0
	var pi=3.1416

	var factor=2*pi/(wavegen.wl_factor)

	for i in range(4):
		pos_y += amps[i] * cos( freqs[i] * (t - factor *pos_x) + phases[i])

	return pos_y

func _fixed_process(delta):
	t += delta / 100

	var pos_y = eval_wave(base_pos.x,freqs,phases,amps)

	var size = get_node("Sprite").get_texture().get_size()
	size *= get_node("Sprite").get_scale()
	
	var reg_rect=get_node("Sprite").get_region_rect()
	
	var rect = Rect2(Vector2(base_pos.x,pos_y)-0.5*reg_rect.size, reg_rect.size)

	#var rect = Rect2(get_node("Sprite").get_global_pos()-0.5*size, size)
	var rect = get_node("Sprite").get_region_rect()
	rect.pos = get_global_pos()
	rect.size *= get_node("Sprite").get_scale()
	print ("rect pos:" + str(rect.pos))
	print ("  size:" + str(rect.size))
	
	# get factors for global pos
	#var global_wave_x = get_pos().x - get_global_pos().x
	#var global_wave_y = get_pos().y - get_global_pos().y

	var wv1=gamemanager.wave1
	var wv2=gamemanager.wave2
	var wv3=gamemanager.wave3
	var wv4=gamemanager.wave4

	var real_freqs=[wv1.frequency,wv2.frequency,wv3.frequency,wv4.frequency]
	var real_amps=[wv1.amplitude,wv2.amplitude,wv3.amplitude,wv4.amplitude]
	var real_phases=[wv1.angle_offset,wv2.angle_offset,wv3.angle_offset,wv4.angle_offset]

	var eval_point=Vector2(base_pos.x,eval_wave(base_pos.x,real_freqs,real_phases,real_amps))
	#eval_point += gamemanager.wavegenerator.get_node("Sprite").get_global_pos()
	eval_point += Vector2(wavegen.wave_start*2,0) + get_global_pos()
	#eval_point.x += - get_pos().x
	#eval_point.y += 30

	print("eval: " + str(eval_point))
	print(reg_rect.size)

	#print(eval_point)
	#print(Vector2(base_pos.x,pos_y))

	#set_pos(Vector2(base_pos.x+wavegen.wave_start*2, base_pos.y + pos_y))
	set_pos(Vector2(eval_point.x+wavegen.wave_start*2, eval_point.y))

	get_node("Particles2D").set_emitting(false)
	#if rect.has_point(get_viewport().get_mouse_pos()):
	if rect.has_point(eval_point):
		#print("collision")
		get_node("Particles2D").set_emitting(true)
