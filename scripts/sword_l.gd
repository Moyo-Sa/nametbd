extends Area2D


func _ready():
	monitoring = false
	print("monitoring is ", monitoring)
		 

#deal attack damage based on villain
func _on_body_entered(body: Node2D) -> void:
	if not monitoring:
		return
	print(body, "entered the SwordL area")

	if body.is_in_group("villain"):
		match body.name:
			"Goblin":
				body.hit(50)
			"Hunter":
				body.hit(10)
			"Nightbourne":
				body.hit(20)
			_:
				body.hit()
