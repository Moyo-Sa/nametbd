extends State

class_name AttackState

@export var run_state: State
@export var dead_state: State
@onready var attack_finished: bool = false

func on_enter():
	attack_finished = false
	playback.travel("attack")
	print("Villain is in attack state")
	var attack_length = character.animation_player.get_animation("attack").length
	await character.get_tree().create_timer(attack_length).timeout
	print("Villain attacks")
	attack_finished = true
	# Only switch states after attack is finished
	if not attack_finished:
		return
	else:	
		if character.is_dead:
			next_state = dead_state
		else:
			next_state = run_state

func on_exit():
	attack_finished = false	
