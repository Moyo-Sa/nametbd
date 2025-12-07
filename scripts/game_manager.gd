extends Node

#health logic
var max_health = 100
var current_health = 100: set = set_health

signal health_updated(new_health)

func set_health(new_value):
	current_health = clamp(new_value, 0, max_health)# Clamp the value to ensure it stays between 0 and max_health.
	health_updated.emit(current_health)#update health bar
	print("Global Health set to: ", current_health)

func reset_health():
	set_health(100)

#score logic
var score =0

#update score
func add_point():
	score += 1
	print(score)

func reset_score():
	score = 0
