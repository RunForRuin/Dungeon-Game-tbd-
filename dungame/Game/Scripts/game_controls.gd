extends Node2D

#variables for phases and turns
var phases = 3 #sets the number of phases
var phase_num = 0
var phase
var turn = 1
#signals for phases and turns
signal next_turn #may not end up being useful
signal dice_phase
signal enemy_phase
signal card_phase


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (Input.is_action_just_pressed("Change turn")): #possibly delete later - depends on other phases
		emit_signal("next_turn")
	pass
	

#controls the turns/phases - 3 phases per turn (card, dice, enemy)
func Next_Turn() -> void:
	if phase_num < phases:
		phase_num += 1
	else:
		phase_num = 1 
		turn += 1
	
	if phase_num == 1:
		phase = "Card Phase"
		emit_signal("card_phase")
	elif phase_num == 2:
		phase = "Dice Phase"
		emit_signal("dice_phase")
	elif phase_num == 3:
		phase = "Enemy Phase"
		emit_signal("enemy_phase")

# When signal "next_turn" is emitted
func _on_next_turn() -> void:
	Next_Turn()
	print("turn ",turn,", ","phase ",phase_num,": ", phase)
