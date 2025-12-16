extends Area2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer




func _on_body_entered(body: Node2D) -> void:
	print("Defense enabled")
	animation_player.play("pickup") # play sound
	GameManager.enable_defense() # add points
	body.defense_tween()
