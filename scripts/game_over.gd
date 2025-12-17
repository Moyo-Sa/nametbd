extends CanvasLayer

@onready var score_label: Label = $scoreLabel




#display the coins collected
func _ready():
	print(GameManager.score) 
	score_label.text = "You scored " + str(GameManager.score) +  "points, and collected " + str(GameManager.coins) + "/100 coins "  + str(GameManager.scroll) +  "/4 scrolls!\n You need all 4 scrolls to win!"
	

func _on_new_game_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game.tscn")
	GameManager.reset_score()
	GameManager.reset_health()
	GameManager.reset_enemies()
	GameManager.reset_scrolls()
	GameManager.reset_collectibles()
	GameManager.player_position = Vector2.ZERO


func _on_retry_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game.tscn")
	GameManager.reset_health()
	
