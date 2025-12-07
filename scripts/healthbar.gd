extends ProgressBar

@onready var healthbar: ProgressBar = $"."
@onready var damage: ProgressBar = $Damage
@onready var timer: Timer = $Timer
var use_game_manager: bool = true


func update_health_UI(new_health):
	var prev_health = value
	value = min(max_value, new_health)
	
	value = new_health
	
	if new_health < prev_health:
		timer.start()
	else:
		damage.value = new_health

func _on_timer_timeout() -> void:
	damage.value = value


func _ready() -> void:	
	timer.timeout.connect(_on_timer_timeout)
	if use_game_manager:
		max_value = GameManager.max_health
		value = GameManager.current_health
		damage.max_value = GameManager.max_health
		damage.value = GameManager.current_health
		GameManager.health_updated.connect(update_health_UI)
