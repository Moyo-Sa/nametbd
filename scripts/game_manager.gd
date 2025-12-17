extends Node

var collected_scrolls: Array = []
var defeated_enemies: Array = []
var collectibles: Array = []
# GameManager.gd
var player_position: Vector2 = Vector2.ZERO


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
var coins = 0


#update score
func add_point():
	score += 1
	coins += 1
	print(score)

func reset_score():
	score = 0
	coins = 0

func collect_scroll():
	score += 5
	scroll += 1

func enable_defense():
	score += 3
	

func reset_enemies():
	defeated_enemies.clear()

func reset_scrolls():
	collected_scrolls.clear()
	
func reset_collectibles():
	collectibles.clear()
	
	
	
