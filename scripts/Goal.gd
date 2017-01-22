extends Node2D

var startTimes = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
var timer = 0.0

func _ready():
	set_fixed_process(true)
	for i in range(startTimes.size()):
		startTimes[i] = randf()

func _fixed_process(delta):
	timer += delta
	for i in range(startTimes.size()):
		if timer > startTimes[i]:
			get_node("Particles" + str(i)).set_emitting(true)