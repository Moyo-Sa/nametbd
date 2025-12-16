extends State

class_name DeadState



func on_enter():
	playback.travel("die")
	await character.get_tree().create_timer(1.2).timeout
	print("Villain dies")
	character.queue_free()
	

	
	
	
