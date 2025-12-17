extends CharacterBody2D

@onready var player: Sprite2D = $Sprite2D
@onready var healthbar: ProgressBar = $Healthbar
@onready var death_sound: AudioStreamPlayer2D = $DeathSound
@onready var damage_amount: int = 10
@onready var animation_tree: AnimationTree = $AnimationTree
@onready var state_machine: CharacterStateMachine = $CharacterStateMachine
@onready var is_defense_active: bool = false
@onready var sword_s: Area2D = $SwordS
@onready var sword_l: Area2D = $SwordL


@export var speed: float = 250.0
const JUMP_VELOCITY = -400.0

var is_dead: bool = false
var current_health
var direction: Vector2 = Vector2.ZERO

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


#player process function
func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	
	# Handle the jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	#handle flipping sprite image
	if direction.x > 0:
		player.flip_h = false
		sword_l.position.x = 0
		sword_s.position.x = 0
	elif direction.x < 0:
		player.flip_h = true
		sword_l.position.x = -65
		sword_s.position.x = -65
	
	#handle speed
	if direction.x != 0 && state_machine.check_can_move():
		velocity.x = direction.x * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		
	update_animation(direction)
	move_and_slide()
	
	
#handle animation
func update_animation(direction):
	animation_tree.set("parameters/move/blend_position", direction.x)
	

#on ready to initialize player's health
func _ready() -> void:
	add_to_group("player")
	GameManager.max_health = 200
	animation_tree.active = true
	print("The player's current health is " , GameManager.current_health)
	# restore position if retrying
	if GameManager.player_position != Vector2.ZERO:
		global_position = GameManager.player_position

	
	

#function for adjusting healthbar and player's health
func player_damage(damage_amount):
	if is_defense_active:  # freeze health
		print("Defense blocked damage!")
		return
	death_sound.play()
	damage_tween()
	GameManager.set_health(GameManager.current_health - damage_amount)
	
#function for dying 
func die():
	if is_dead:
		return

	is_dead = true
	 # save current position before dying
	GameManager.player_position = global_position
	death_sound.play()
	state_machine.switch_state(state_machine.get_node("Death"))
	#player.play("die")
	print("Player dies")	
	
#function for tweening
func defense_tween():
	#enable health freeze
	is_defense_active = true 
	# Change player color 
	var tween := create_tween()
	tween.tween_property(self, "modulate", Color.AQUAMARINE, 0.5)

	# Wait 20secs 
	await get_tree().create_timer(20.0).timeout

	# Change color back 
	tween = create_tween()
	tween.tween_property(self, "modulate", Color.WHITE, 0.5)
	
	#disable health freeze
	is_defense_active = false 

func health_tween():
	#dont interrupt tween
	if is_defense_active:
		return
	# Change player color 
	var tween := create_tween()
	tween.tween_property(self, "modulate", Color.MEDIUM_PURPLE, 0.5)
	await get_tree().create_timer(2.0).timeout
	# Change color back 
	tween = create_tween()
	tween.tween_property(self, "modulate", Color.WHITE, 0.5)

func damage_tween():
	if is_defense_active:  # freeze health
		print("Defense is active, no damage!")
		return
	# Change player color 
	var tween := create_tween()
	tween.tween_property(self, "modulate", Color.INDIAN_RED, 0.5)
	await get_tree().create_timer(0.5).timeout
	# Change color back 
	tween = create_tween()
	tween.tween_property(self, "modulate", Color.WHITE, 0.5)
