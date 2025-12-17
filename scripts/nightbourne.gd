extends CharacterBody2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var healthbar: ProgressBar = $VHealthbar
@onready var death_sound: AudioStreamPlayer2D = $DeathSound
@export var gravity: float = 980.0
@onready var sprite2D: Sprite2D = $Sprite2D
@onready var state_machine: CharacterStateMachine = $CharacterStateMachine
@onready var target_player: Node = null
@onready var animation_tree: AnimationTree = $AnimationTree


#health variables
@onready var damage_amount: int = 20
@onready var max_health = 100
@onready var current_health = 100: set = set_health
var is_dead: bool = false

signal health_updated(new_health) 

func _ready():
	if GameManager.defeated_enemies.has(self.name):
		queue_free()
		
	if is_dead:
		return
	
	add_to_group("villain")
	animation_tree.active = true
	#healthbar.use_game_manager = false 
	healthbar.max_value = max_health
	healthbar.value = current_health
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
	if is_dead:
		return
	if damage == 0:
		damage = damage_amount
	set_health(current_health - damage_amount)
	death_sound.play() 
	state_machine.switch_state(state_machine.get_node("Hit"))


func die():
	if is_dead:
		return
	is_dead = true 
	print("I got to nighbourne die trigger")
	if not GameManager.defeated_enemies.has(self.name):
		GameManager.defeated_enemies.append(self.name)
	death_sound.play() 
	state_machine.switch_state(state_machine.get_node("Die"))

	
	
