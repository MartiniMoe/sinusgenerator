extends Node2D

var amplitude = 0
var frequency = 0
var angle = 0.0
var color = Color(0, 0, 0)

func _ready():
	pass

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
	var center = Vector2(0, get_parent().amplitude)
	draw_line(center, Vector2(center.x, center.y + amplitude), color, 2.0)
	draw_transparent_circle(center, amplitude, color)