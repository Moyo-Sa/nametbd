extends State

class_name IdleState

@export var run_state: State

func on_enter():
	playback.travel("idle")

func state_process(delta):
	if character.target_player:
		next_state = run_state
