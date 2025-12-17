extends Area2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var label: Label = $Label


func _on_body_entered(body: Node2D) -> void:
	# Check if already collected - exit early if so
	if GameManager.collected_scrolls.has(self.name):
		return
	print("Fire scoll passed")
	
	GameManager.collected_scrolls.append(self.name)
	GameManager.collect_scroll() # collect scroll
	get_tree().call_group("scroll_hud", "update_scrolls") #update UI
	animation_player.play("pickup") # play sound
	label.visible = true
	label.text = "Fire Scroll Collected!"
	await get_tree().create_timer(5).timeout
	label.visible = false

func _ready():
	if GameManager.collected_scrolls.has(self.name):
		queue_free()

	label.visible = false
	label.text = ""
