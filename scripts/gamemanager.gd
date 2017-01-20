extends Node

# THIS SCRIPTS KEEPS REFERENCES AND VARIABLE 
# FOR ACCESS FROM ALL OTHER NODES / SCRIPTS
# IT IS ACCESSABLE AS A SINGLETON

var time_elapsed = 0.0

func _ready():
	set_fixed_process(true)

func _fixed_process(delta):
	time_elapsed += delta