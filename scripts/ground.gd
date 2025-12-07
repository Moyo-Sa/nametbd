extends State

class_name Ground

@export var jump_velocity: float = -200.0
@export var air_state: State
@export var attack_state: State
@export var jump_animation: String = "jump"
@onready var slash_animation: String = "slash"
@onready var lunge_animation: String = "lunge"
@export var attack_node: String = "slash"

#code to handle jumping
func state_input(event: InputEvent):
	if (event.is_action_pressed("jump")):
		jump()
	if (event.is_action_pressed("slash")):
		attack_node = "slash"
		attack()
	if (event.is_action_pressed("lunge")):
		attack_node = "lunge"
		attack()

func state_process(delta):
	if (!character.is_on_floor()):
		next_state = air_state

func jump():
	character.velocity.y = jump_velocity
	next_state = air_state 
	playback.travel(jump_animation)

func attack():
	next_state = attack_state
	attack_state.queue_attack(attack_node)
