extends Area2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _on_body_entered(body: Node2D) -> void:
	print("fruit passed")
	animation_player.play("pickup") # play sound
	GameManager.set_health(200) #update health
	GameManager.add_point()
	body.health_tween()
	if not GameManager.collectibles.has(self.name): 
		GameManager.collectibles.append(self.name)

func _ready():
	if GameManager.collectibles.has(self.name):
		queue_free()
