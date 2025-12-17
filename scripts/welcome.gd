extends CanvasLayer


func _on_new_game_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game.tscn")
	GameManager.reset_score()
	GameManager.reset_health()
	GameManager.reset_enemies()
	GameManager.reset_scrolls()
	GameManager.reset_collectibles()
	GameManager.player_position = Vector2.ZERO
