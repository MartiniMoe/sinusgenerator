extends Node2D

var freqs = [ 0.0, 0.0, 0.0, 0.0 ]
var phases = [ 0.0, 0.0, 0.0, 0.0 ]
var amps = [ 0.0, 0.0, 0.0, 0.0 ]

var base_pos = Vector2(0.0, 0.0)
var t = 0.0
var wavegen

var local_base_pos_offset
var global_base_pos_offset

func _ready():
	wavegen=gamemanager.wavegenerator
	
	local_base_pos_offset=Vector2(wavegen.wave_start*2,0)
	
	base_pos = get_pos() - local_base_pos_offset
	
	#reasons…
	#local_base_pos_offset.y=base_pos.y
	
	set_fixed_process(true)

func eval_wave(pos_x,freqs,phases,amps):
	var pos_y = 0.0
	var pi=3.1416

	var factor=2*pi/(wavegen.wl_factor)

	for i in range(4):
		pos_y += amps[i] * cos( freqs[i] * (t - factor *pos_x) + phases[i])

	return pos_y

var colliding = false
func _fixed_process(delta):
	
	t += delta / 100

	var wv1=gamemanager.wave1
	var wv2=gamemanager.wave2
	var wv3=gamemanager.wave3
	var wv4=gamemanager.wave4

	var real_freqs=[wv1.frequency,wv2.frequency,wv3.frequency,wv4.frequency]
	var real_amps=[wv1.amplitude,wv2.amplitude,wv3.amplitude,wv4.amplitude]
	var real_phases=[wv1.angle_offset,wv2.angle_offset,wv3.angle_offset,wv4.angle_offset]

	var wanted_wave_point = Vector2(base_pos.x,eval_wave(base_pos.x,freqs,phases,amps))
	var actual_wave_point=Vector2(base_pos.x,eval_wave(base_pos.x,real_freqs,real_phases,real_amps))

	var size = get_node("Sprite").get_texture().get_size()
	size *= get_node("Sprite").get_scale()
	
	var rect = get_node("Sprite").get_region_rect()
	rect.pos = get_global_pos()
	rect.size *= get_node("Sprite").get_scale()
	
	set_pos(Vector2(1,1))
	var global_scale=get_global_pos()
	
	global_base_pos_offset=get_global_pos() - get_pos()
	
	var global_wanted_wave_point=global_scale*(global_base_pos_offset+wanted_wave_point+local_base_pos_offset+Vector2(0,base_pos.y))
	var global_actual_wave_point=global_scale*(global_base_pos_offset+actual_wave_point+local_base_pos_offset+Vector2(0,340))

	set_global_pos(global_wanted_wave_point)

	if rect.has_point(global_actual_wave_point):
		get_node("Particles2D").set_emitting(true)
		if !colliding:
			get_parent().numCollidingObstacles += 1
			colliding = true
	else:
		get_node("Particles2D").set_emitting(false)
		if colliding:
			get_parent().numCollidingObstacles -= 1
			colliding = false
