extends Node2D

signal next_turn
signal roll_dice
var phases = 3 #sets the number of phases
var phase_num = 0
var phase
var turn = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (Input.is_action_just_pressed("Change turn")):
		emit_signal("next_turn")
		
	pass
	
func Next_Turn() -> void:
	if phase_num < phases:
		phase_num += 1
	else:
		phase_num = 1 
		turn += 1
	
	if phase_num == 1:
		phase = "Card Phase"
	elif phase_num == 2:
		phase = "Dice Phase"
		emit_signal("roll_dice")
	elif phase_num == 3:
		phase = "Enemy Phase"

# When signal "next_turn" is emitted
func _on_next_turn() -> void:
	Next_Turn()
	print("turn ",turn,", ","phase ",phase_num,": ", phase)
