extends CharacterBody2D

@onready var player: Sprite2D = $Sprite2D
@onready var healthbar: ProgressBar = $Healthbar
@onready var death_sound: AudioStreamPlayer2D = $DeathSound
@onready var damage_amount: int = 25
@onready var animation_tree: AnimationTree = $AnimationTree
@onready var state_machine: CharacterStateMachine = $CharacterStateMachine



@export var speed: float = 130.0

var is_dead: bool = false
var current_health
var direction: Vector2 = Vector2.ZERO

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


#player process function
func _physics_process(delta):
	# Add the velocity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Get the input direction and handle the movement/deceleration.
	direction = Input.get_vector("move_left", "move_right", "up", "down")
	
	#handle flipping sprite image
	if direction.x > 0:
		player.flip_h = false
	elif direction.x < 0:
		player.flip_h = true
	
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
	GameManager.max_health = 100
	animation_tree.active = true
	
	

#function for adjusting healthbar and player's health
func player_damage():
	GameManager.set_health(GameManager.current_health - damage_amount)
	
#function for dying 
func die():
	if is_dead:
		return
	
	is_dead = true
	GameManager.previous_scene_path = get_tree().current_scene.scene_file_path
	death_sound.play()
	#player.play("die")
	print("Player dies")	
