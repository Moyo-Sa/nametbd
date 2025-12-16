extends Area2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _on_body_entered(body: Node2D) -> void:
	print("fruit passed")
	animation_player.play("healthUp") # play sound
	GameManager.set_health(200) #update health
	GameManager.add_point()
	body.health_tween()
