extends Area2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer




func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		print("Defense enabled")
		animation_player.play("pickup") # play sound
		GameManager.enable_defense() # add points
		body.defense_tween()
		if not GameManager.collectibles.has(self.name): 
			GameManager.collectibles.append(self.name)

func _ready():
	if GameManager.collectibles.has(self.name):
		queue_free()
