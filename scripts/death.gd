extends State

class_name DemiseState


func on_enter():
	playback.travel("death")
	await character.get_tree().create_timer(1.2).timeout
	print("Player dies")
	character.queue_free()
	get_tree().change_scene_to_file("res://scenes/game_over.tscn")
