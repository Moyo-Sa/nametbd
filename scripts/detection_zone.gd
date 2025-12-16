extends Area2D

@onready var villain = get_parent()
@onready var state_machine: CharacterStateMachine = get_parent().get_node("CharacterStateMachine")


#action when player gets close to villain
func _on_body_entered(body):
	if body.is_in_group("player"):
		villain.target_player = body
		state_machine.switch_state(state_machine.get_node("Run"))
		print("Player detected")
		
