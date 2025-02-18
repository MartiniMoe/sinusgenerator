extends Node2D

export var amplitude = 0
export var frequency = 0
var angle_offset = 0.0
var angle = 0.0
var color = Color(0, 0, 0)
var center = Vector2(0, 0)
var current_pos = Vector2(0,0)
var time = 0.0

var sprite_size=800

var cur_circle
var cur_line

var line_scene
#var cur_line.get_material()
var circle_scene
var circle_mat

func _ready():
	set_fixed_process(true)

func add_childs():
	add_child(cur_line)
	#cur_line.get_material()=cur_line.get_material()
	
	add_child(cur_circle)
	circle_mat=cur_circle.get_material()
	
	cur_line.set_z(-1)
	cur_circle.set_z(-1)

func _fixed_process(delta):
	center = get_parent().current_pos
	#angle += (gamemanager.time_delta / 100) * (frequency)
	angle = time * frequency + angle_offset
	current_pos = center + Vector2(sin(angle)*amplitude,cos(angle)*amplitude)
	
	cur_line.get_material().set_shader_param("pos1",Vector2(0.5,0.5)+1.0/sprite_size*center)
	cur_line.get_material().set_shader_param("pos2",Vector2(0.5,0.5)+1.0/sprite_size*current_pos)
	cur_line.get_material().set_shader_param("width",.003)
	cur_line.get_material().set_shader_param("line_col",color)
	
	circle_mat.set_shader_param("pos",Vector2(0.5,0.5)+1.0/sprite_size*center)
	circle_mat.set_shader_param("radius",1.0/sprite_size*amplitude)
	circle_mat.set_shader_param("circle_col",color)
	circle_mat.set_shader_param("width",.003)
	
	time += gamemanager.time_delta / 100

func set_vars(amp, freq, col):
	amplitude = amp
	frequency = freq
	color = col

func set_amp(amp):
	amplitude=amp

func set_freq(freq):
	frequency=freq
	#angle_offset=angle - time * frequency

func set_phase(phase):
	angle_offset=phase
	#angle=phase