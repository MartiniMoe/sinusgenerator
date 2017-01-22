extends Control

func _ready():
	pass

func set_gui_waves():
	get_node("Wave1/Slider1f").set_value(gamemanager.wave1.frequency)
	get_node("Wave2/Slider2f").set_value(gamemanager.wave2.frequency)
	get_node("Wave3/Slider3f").set_value(gamemanager.wave3.frequency)
	get_node("Wave4/Slider4f").set_value(gamemanager.wave4.frequency)

	get_node("Wave1/Slider1a").set_value(gamemanager.wave1.amplitude)
	get_node("Wave2/Slider2a").set_value(gamemanager.wave2.amplitude)
	get_node("Wave3/Slider3a").set_value(gamemanager.wave3.amplitude)
	get_node("Wave4/Slider4a").set_value(gamemanager.wave4.amplitude)
	
	get_node("Wave1/Slider1p").set_value(gamemanager.wave1.angle_offset)
	get_node("Wave2/Slider2p").set_value(gamemanager.wave2.angle_offset)
	get_node("Wave3/Slider3p").set_value(gamemanager.wave3.angle_offset)
	get_node("Wave4/Slider4p").set_value(gamemanager.wave4.angle_offset)

func _on_Slider1f_value_changed( value ):
	gamemanager.wave1.set_freq(value)
	var updated_offset=gamemanager.wave1.angle-gamemanager.wave1.time*gamemanager.wave1.frequency
	updated_offset=mod(updated_offset,6.2831853071795864769252867666)
	get_node("Wave1/Slider1p").set_value(updated_offset)

func _on_Slider1a_value_changed( value ):
	gamemanager.wave1.set_amp(value)
	
func _on_Slider1p_value_changed( value ):
	gamemanager.wave1.set_phase(value)

func _on_Slider2f_value_changed( value ):
	gamemanager.wave2.set_freq(value)
	var updated_offset=gamemanager.wave2.angle-gamemanager.wave2.time*gamemanager.wave2.frequency
	updated_offset=mod(updated_offset,6.2831853071795864769252867666)
	get_node("Wave2/Slider2p").set_value(updated_offset)

func _on_Slider2a_value_changed( value ):
	gamemanager.wave2.set_amp(value)

func _on_Slider2p_value_changed( value ):
	gamemanager.wave2.set_phase(value)

func _on_Slider3f_value_changed( value ):
	gamemanager.wave3.set_freq(value)
	var updated_offset=gamemanager.wave3.angle-gamemanager.wave3.time*gamemanager.wave3.frequency
	updated_offset=mod(updated_offset,6.2831853071795864769252867666)
	get_node("Wave3/Slider3p").set_value(updated_offset)

func _on_Slider3a_value_changed( value ):
	gamemanager.wave3.set_amp(value)

func _on_Slider3p_value_changed( value ):
	gamemanager.wave3.set_phase(value)

func mod(x,y):
	return x - y * floor(x/y)

func _on_Slider4f_value_changed( value ):
	gamemanager.wave4.set_freq(value)
	var updated_offset=gamemanager.wave4.angle-gamemanager.wave4.time*gamemanager.wave4.frequency
	updated_offset=mod(updated_offset,6.2831853071795864769252867666)
	get_node("Wave4/Slider4p").set_value(updated_offset)

func _on_Slider4a_value_changed( value ):
	gamemanager.wave4.set_amp(value)

func _on_Slider4p_value_changed( value ):
	gamemanager.wave4.set_phase(value)
