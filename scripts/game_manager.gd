extends Node

var previous_scene_path: String = ""

#health logic
var max_health = 200
var current_health = 200: set = set_health

signal health_updated(new_health)

func set_health(new_value):
	current_health = clamp(new_value, 0, max_health)# Clamp the value to ensure it stays between 0 and max_health.
	health_updated.emit(current_health)#update health bar
	print("This Global Health set to: ", current_health)

func reset_health():
	set_health(200)

#points logic
var score = 0
var scroll = 0


#update score
func add_point():
	score += 1
	print(score)

func reset_score():
	score = 0

func collect_scroll():
	score += 5
	scroll += 1

func enable_defense():
	score += 3
	
	
	
	
	
