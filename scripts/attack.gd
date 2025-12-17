extends State

@export var return_state: State
@export var return_animation_mode: String = "move"
#@onready var timer: Timer = $Timer
var attack_name: String = ""
var attack_queue: Array = []

func state_input(event: InputEvent):
	if (event.is_action_pressed("slash")):
		queue_attack("slash")
	elif (event.is_action_pressed("lunge")):
		queue_attack("lunge")
	#timer.start()

func state_process(delta):
	# Check if player is trying to move while attacks are queued
	var is_moving = Input.is_action_pressed("jump") or \
					Input.is_action_pressed("move_left") or \
					Input.is_action_pressed("move_right")
	if is_moving and attack_queue.size() > 0:
		attack_queue.clear()

# Add attack to queue
func queue_attack(name: String):
	# If already attacking, add to queue
	if attack_name != "":
		attack_queue.append(name)
	else:
		start_attack(name)

# Start an attack immediately
func start_attack(name: String):
	attack_name = name
	playback.start(attack_name)
	#timer.start()
	
func _on_animation_tree_animation_finished(anim_name: StringName) -> void:
	if (anim_name != attack_name):
		return
	#play animation in order of attack buttons pressed
	if attack_queue.size() > 0:
		var next_attack = attack_queue.pop_front()
		start_attack(next_attack)
	else:
		attack_name = ""
		attack_queue.clear()
		next_state = return_state
		playback.start(return_animation_mode)
		
