extends Node2D

var amplitude = 0
var frequency = 0
var angle = 0.0
var color = Color(0, 0, 0)
var center = Vector2(0, 0)
var current_pos = Vector2(0,0)

var cur_circle
var cur_line

var line_scene
var line_mat
var circle_scene
var circle_mat

func _ready():
	set_fixed_process(true)
	
	#add_child(cur_line)
	#line_mat=cur_line.get_material()
	
	#add_child(cur_circle)
	#circle_mat=cur_circle.get_material()

func _fixed_process(delta):
	center = get_parent().current_pos
	angle += (gamemanager.time_delta / 100) * (frequency)
	current_pos = center + Vector2(sin(angle)*amplitude,cos(angle)*amplitude)
	
	update()

func set_vars(amp, freq, col):
	amplitude = amp
	frequency = freq
	color = col

func draw_transparent_circle (center, radius, color):
    var nb_points = 32
    var points_arc = Vector2Array()

    for i in range(nb_points+1):
        var angle_point = i*360/nb_points - 90
        var point = center + Vector2( cos(deg2rad(angle_point)), sin(deg2rad(angle_point)) ) * radius
        points_arc.push_back( point )

    for indexPoint in range(nb_points):
        draw_line(points_arc[indexPoint], points_arc[indexPoint+1], color)

func _draw():
	#draw_line(center, Vector2(current_x, current_y + center.y + amplitude), color, 2.0)
	
	#line_mat.set_shader_param("pos1",Vector2(0.5,0.5)+.002*center)
	#line_mat.set_shader_param("pos2",Vector2(0.5,0.5)+.002*Vector2(current_x,current_y))
	#line_mat.set_shader_param("width",.003)
	#line_mat.set_shader_param("line_col",color)
	
	#circle_mat.set_shader_param("pos",Vector2(0.5,0.5)+.002*center)
	#circle_mat.set_shader_param("radius",.002*amplitude)
	#circle_mat.set_shader_param("circle_col",color)
	#circle_mat.set_shader_param("width",.003)
	
	draw_line(center, current_pos, color, 2.0)
	draw_transparent_circle(center, amplitude, color)