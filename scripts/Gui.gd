extends Control

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass


func _on_Slider1f_value_changed( value ):
	gamemanager.wave1.frequency = value


func _on_Slider1a_value_changed( value ):
	gamemanager.wave1.amplitude = value


func _on_Slider2f_value_changed( value ):
	gamemanager.wave2.frequency = value


func _on_Slider2a_value_changed( value ):
	gamemanager.wave2.amplitude = value


func _on_Slider3f_value_changed( value ):
	gamemanager.wave3.frequency = value


func _on_Slider3a_value_changed( value ):
	gamemanager.wave3.amplitude = value


func _on_Slider4f_value_changed( value ):
	gamemanager.wave4.frequency = value


func _on_Slider4a_value_changed( value ):
	gamemanager.wave4.amplitude = value
