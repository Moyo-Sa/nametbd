extends CharacterBody2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var death_sound: AudioStreamPlayer2D = $DeathSound
@onready var animation_tree: AnimationTree = $AnimationTree
@onready var state_machine: CharacterStateMachine = $CharacterStateMachine


#health variables
@onready var healthbar: ProgressBar = $Healthbar
@onready var damage_amount: int = 50
@onready var max_health = 100
@onready var current_health = 100: set = set_health
var is_dead: bool = false
const SPEED = 60
@onready var direction = 1
var gravity = 420



signal health_updated(new_health) 

func _ready():
	if is_dead:
		return
	
	add_to_group("villain")
	healthbar.use_game_manager = false 
	healthbar.max_value = max_health
	healthbar.value = current_health
	healthbar.damage.max_value = max_health 
	healthbar.damage.value = current_health
	health_updated.connect(healthbar.update_health_UI)

func _physics_process(delta):
	velocity.y += gravity * delta
	move_and_slide()

func set_health(new_value):
	current_health = clamp(new_value, 0, max_health)# Clamp the value to ensure it stays between 0 and max_health.
	health_updated.emit(current_health)#update health bar
	print("Set health to: ", current_health)
	if current_health <= 0:
		die()

func hit(damage: float = 0):
	if damage == 0:
		damage = damage_amount
	set_health(current_health - damage_amount)
	#change to hit state
	#state_machine.switch_state(state_machine.get_node("Hit"))

func die():
	if is_dead:
		return
	
	is_dead = true
	#animation_tree["parameters/playback"].travel("Die")
	print("AFTER PLAY:", animation_player.current_animation)
	death_sound.play()
	print("Goblin dies")
	await animation_player.animation_finished
	await get_tree().create_timer(1).timeout
	queue_free()
	
