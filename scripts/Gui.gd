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
	
	get_node("Waves/HSplitContainer/Wave1/Sliders/Phase/Slider1p").set_value(gamemanager.wave1.angle_offset)
	get_node("Waves/HSplitContainer/Wave2/Sliders/Phase/Slider2p").set_value(gamemanager.wave2.angle_offset)
	get_node("Waves/HSplitContainer2/Wave3/Sliders/Phase/Slider3p").set_value(gamemanager.wave3.angle_offset)
	get_node("Waves/HSplitContainer2/Wave4/Sliders/Phase/Slider4p").set_value(gamemanager.wave4.angle_offset)

func _on_Slider1f_value_changed( value ):
	gamemanager.wave1.set_freq(value)

func _on_Slider1a_value_changed( value ):
	gamemanager.wave1.set_amp(value)
	
func _on_Slider1p_value_changed( value ):
	gamemanager.wave1.set_phase(value)


func _on_Slider2f_value_changed( value ):
	gamemanager.wave2.set_freq(value)

func _on_Slider2a_value_changed( value ):
	gamemanager.wave2.set_amp(value)

func _on_Slider2p_value_changed( value ):
	gamemanager.wave2.set_phase(value)


func _on_Slider3f_value_changed( value ):
	gamemanager.wave3.set_freq(value)

func _on_Slider3a_value_changed( value ):
	gamemanager.wave3.set_amp(value)

func _on_Slider3p_value_changed( value ):
	gamemanager.wave3.set_phase(value)


func _on_Slider4f_value_changed( value ):
	gamemanager.wave4.set_freq(value)

func _on_Slider4a_value_changed( value ):
	gamemanager.wave4.set_amp(value)

func _on_Slider4p_value_changed( value ):
	gamemanager.wave4.set_phase(value)
