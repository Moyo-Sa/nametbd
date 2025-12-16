extends CanvasLayer

@onready var score_label: Label = $scoreLabel




#display the coins collected
func _ready():
	print(GameManager.score) 
	score_label.text = "You have collected " + str(GameManager.score) + "/60 coins!"
	

func _on_new_game_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game.tscn")
	GameManager.reset_score()
	GameManager.reset_health()


func _on_retry_pressed() -> void:
	get_tree().change_scene_to_file(GameManager.previous_scene_path)
	GameManager.reset_health()
	
