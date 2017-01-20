extends Control

func _ready():
	get_node("Waves/HSplitContainer/Wave1/Sliders/Frequency/Slider1f").set_value(gamemanager.wave1.frequency)
	get_node("Waves/HSplitContainer/Wave2/Sliders/Frequency/Slider2f").set_value(gamemanager.wave2.frequency)
	get_node("Waves/HSplitContainer2/Wave3/Sliders/Frequency/Slider3f").set_value(gamemanager.wave3.frequency)
	get_node("Waves/HSplitContainer2/Wave4/Sliders/Frequency/Slider4f").set_value(gamemanager.wave4.frequency)

	get_node("Waves/HSplitContainer/Wave1/Sliders/Amplitude/Slider1a").set_value(gamemanager.wave1.amplitude)
	get_node("Waves/HSplitContainer/Wave2/Sliders/Amplitude/Slider2a").set_value(gamemanager.wave2.amplitude)
	get_node("Waves/HSplitContainer2/Wave3/Sliders/Amplitude/Slider3a").set_value(gamemanager.wave3.amplitude)
	get_node("Waves/HSplitContainer2/Wave4/Sliders/Amplitude/Slider4a").set_value(gamemanager.wave4.amplitude)

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
