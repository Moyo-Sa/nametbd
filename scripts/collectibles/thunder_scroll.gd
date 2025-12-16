extends Area2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer



func _on_body_entered(body: Node2D) -> void:
	print("Fire scoll passed")
	animation_player.play("pickup") # play sound
	GameManager.collect_scroll() 
