extends ProgressBar


@onready var healthbar: ProgressBar = $"."
@onready var damage: ProgressBar = $Damage
@onready var timer: Timer = $Timer



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
	print("here with my villain")
	timer.timeout.connect(_on_timer_timeout)
	
