extends Area2D
@onready var exit_l: Label = $exitL



func _ready():
	exit_l.visible = false
	exit_l.text = "\nYou are almost there!"

func _on_body_entered(body: Node2D) -> void:
	if GameManager.scroll == 4:
		get_tree().change_scene_to_file("res://scenes/win.tscn")
	else:
		exit_l.visible = true
		exit_l.text = "\nYou are almost there! \n You need all 4 scrolls to win this game!"
		print("Scroll is ", GameManager.scroll)



func _on_body_exited(body: Node2D) -> void:
	exit_l.visible = false
