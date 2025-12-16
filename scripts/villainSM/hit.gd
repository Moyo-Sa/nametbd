extends State

class_name HitState

@onready var damage_amount: int = 20
@export var dead_state: State
@export var idle_state: State


func on_enter():
	playback.travel("hit")

func state_process(delta):
	if character.current_health <= 0:
		next_state = dead_state
	else:
		next_state = idle_state
	
		
