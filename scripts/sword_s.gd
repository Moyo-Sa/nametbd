extends Area2D


func _ready():
	monitoring = true
	print("monitoring is ", monitoring)
	
	
func _on_body_entered(body: Node2D) -> void:
	print("HIT DETECTED!")
	if not monitoring:
		return
		
	print(body, "entered the SwordS area")
	if body.is_in_group("villain"):
		match body.name:
			"Goblin":
				body.hit(40)
			"Hunter":
				body.hit(8)
			"Nightbourne":
				body.hit(16)
			_:
				body.hit()
