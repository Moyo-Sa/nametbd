extends CanvasLayer

@onready var win_label: Label = $winLabel

func _on_new_game_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game.tscn")
	GameManager.reset_score()
	GameManager.reset_health()

func _ready():
	print(GameManager.score) 
	win_label.text =  "You collected " + str(GameManager.score) + "/100 coins!\n"
	
	
