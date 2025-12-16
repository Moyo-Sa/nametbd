extends Area2D

@onready var timer: Timer = $Timer
@onready var hurt_sound: AudioStreamPlayer2D = $HurtSound



			

func _on_timer_timeout() -> void:
	Engine.time_scale = 1.0
	#get_tree().change_scene_to_file("res://scenes/game_over.tscn")


func _on_body_entered(body: Node2D) -> void:
	if body.name == 'Player':
		if GameManager.current_health > 25:	
			hurt_sound.play()
			body.player_damage(5)
		else:
			body.player_damage(5)
			body.die()
			body.get_node("CollisionShape2D").queue_free()
			Engine.time_scale = 0.5
			timer.start()
