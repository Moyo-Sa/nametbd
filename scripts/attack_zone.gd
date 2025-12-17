extends Area2D

@onready var timer: Timer = $Timer
@onready var villain = null
@onready var villain_name: String = "" 

func get_villain_name():
	var current = get_parent()
	
	# Search up the tree until we find a villain
	while current:
		if current.is_in_group("villain"):
			villain = current
			villain_name = current.name
			return
		else:
			current = current.get_parent()
	

func _ready():
	get_villain_name()

func _on_body_entered(body: Node2D) -> void:
	print("AttackZone detected: ", body.name)
	if body == villain:
		return
		
	if body.is_in_group("player"):	
		body.damage_tween()	
		if GameManager.current_health >= 2:	
			match villain:
				"Goblin":
					body.player_damage(2)
				"Hunter":
					body.player_damage(10)
				"Nightbourne":
					body.player_damage(15)
				_:
					body.player_damage(2)
		else:
			body.die()
			body.get_node("CollisionShape2D").queue_free()
			Engine.time_scale = 0.5
			timer.start()
	
