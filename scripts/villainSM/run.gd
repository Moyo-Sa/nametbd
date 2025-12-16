extends State

class_name RunState

@export var speed : float = 200
@export var attack_range : float = 100.0
@export var attack_state: State

func on_enter():
	playback.travel("run")
	print("Villain is in run state")

func state_process(delta):
	
	if character.target_player == null:
		print("ERROR: character is null in RunState!")
		return
	
	#find distance to player
	var distance_to_player = character.position.distance_to(character.target_player.position)
	
	# Switch to attack if close enough
	if distance_to_player <= attack_range:
		next_state = attack_state
		return
	
	var direction = (character.target_player.position - character.position).normalized()
	if direction.x > 0:
		character.sprite2D.flip_h = false
	elif direction.x < 0:
		character.sprite2D.flip_h = true
	character.velocity.x = direction.x * speed
	character.move_and_slide()
