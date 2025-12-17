extends Area2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _on_body_entered(body: Node2D) -> void:
	print("One coin passed")
	animation_player.play("pickup") # play sound
	GameManager.add_point() # add points
	if not GameManager.collectibles.has(self.name): 
		GameManager.collectibles.append(self.name)

func _ready():
	if GameManager.collectibles.has(self.name):
		queue_free()
