extends Node2D

var wave = preload("res://scenes/Wave.tscn")
var line_scene = preload("res://scenes/Line.tscn")
var circle_scene = preload("res://scenes/Circle.tscn")
var wave_shader_scene = preload("res://scenes/Shadersprite.tscn")

var wave_shader_size=Vector2(1500,1000)
var wl_factor=42000

var wave_start=250

var wave_material

# leave this... it is needed to be 0 for the first child wave :D
var current_pos = Vector2(0,0)

var amplitudeArray = [0, 0, 0, 0]
var frequencyArray = [100, 180, 230, 390]
var colorArray = [Color(0.4, 0.4, 0.6), Color(0.5, 0.5, 0.7), Color(0.6, 0.6, 0.8), Color(0.9, 0.9, 1.0)]

func _ready():
	set_fixed_process(true)
	get_node("AnimationPlayer").play("Rotation")
	
	var wave_shader=wave_shader_scene.instance()
	wave_shader.set_scale(wave_shader_size)
	wave_shader.set_pos(Vector2(wave_start+0.5*wave_shader_size.x,0))
	add_child(wave_shader)
	wave_material=wave_shader.get_material()
	
	# add child waves
	var last_added_child = self
	for i in range(amplitudeArray.size()):
		var new_wave = wave.instance()
		new_wave.set_name("wave" + str(i))
		new_wave.set_vars(amplitudeArray[i], frequencyArray[i], colorArray[i])
		
		new_wave.cur_circle=circle_scene.instance()
		new_wave.cur_circle.set_scale(Vector2(new_wave.sprite_size,new_wave.sprite_size))
		new_wave.cur_circle.set_material(new_wave.cur_circle.get_material().duplicate())
		
		new_wave.cur_line=line_scene.instance()
		new_wave.cur_line.set_scale(Vector2(new_wave.sprite_size,new_wave.sprite_size))
		new_wave.cur_line.set_material(new_wave.cur_line.get_material().duplicate())
		
		new_wave.add_childs()
		# add wave as child to last added wave
		last_added_child.add_child(new_wave)
		last_added_child = new_wave
	
	gamemanager.get_waves()
	
func _fixed_process(delta):
	var amp_factor=1/wave_shader_size.y;

	var amp1=amp_factor*gamemanager.wave1.amplitude;
	var amp2=amp_factor*gamemanager.wave2.amplitude;
	var amp3=amp_factor*gamemanager.wave3.amplitude;
	var amp4=amp_factor*gamemanager.wave4.amplitude;
	
	var wl1=1.0/wave_shader_size.x*wl_factor/gamemanager.wave1.frequency;
	var wl2=1.0/wave_shader_size.x*wl_factor/gamemanager.wave2.frequency;
	var wl3=1.0/wave_shader_size.x*wl_factor/gamemanager.wave3.frequency;
	var wl4=1.0/wave_shader_size.x*wl_factor/gamemanager.wave4.frequency;
	
	var ph1=-gamemanager.wave1.angle;
	var ph2=-gamemanager.wave2.angle;
	var ph3=-gamemanager.wave3.angle;
	var ph4=-gamemanager.wave4.angle;
	
	wave_material.set_shader_param("wavelen",Color(wl1,wl2,wl3,wl4))
	wave_material.set_shader_param("amp",Color(amp1,amp2,amp3,amp4))
	wave_material.set_shader_param("phase",Color(ph1,ph2,ph3,ph4))
	wave_material.set_shader_param("width",.003)
	wave_material.set_shader_param("x_max",1)
	
	update()
	
func _draw():
	var cur_pos=gamemanager.wave4.current_pos
	draw_line(cur_pos, Vector2(wave_start,cur_pos.y), Color(1,1,1,1), 2.0)
	draw_circle(Vector2(wave_start,cur_pos.y), 4, Color(1,1,1,1))
