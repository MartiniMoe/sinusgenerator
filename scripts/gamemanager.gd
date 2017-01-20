extends Node

# THIS SCRIPTS KEEPS REFERENCES AND VARIABLE 
# FOR ACCESS FROM ALL OTHER NODES / SCRIPTS
# IT IS ACCESSABLE AS A SINGLETON

var time_elapsed = 0.0
var time_delta = 0.0
var wavegenerator
var wave1
var wave2
var wave3
var wave4

func _ready():
	set_fixed_process(true)

func get_waves():
	wavegenerator = get_node("/root/Main/Level01/Wavegenerator")
	wave1 = wavegenerator.get_node("wave0")
	wave2 = wave1.get_node("wave1")
	wave3 = wave2.get_node("wave2")
	wave4 = wave3.get_node("wave3")

func _fixed_process(delta):
	time_delta = delta
	time_elapsed += delta