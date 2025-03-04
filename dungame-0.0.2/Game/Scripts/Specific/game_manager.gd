extends Node2D

#variables for turn/phase control
var turn = 0
var phase = 0
var phase_max = 3
var phase_name = "start"
#signals for phases/turn
signal next_turn
signal card_phase
signal dice_phase
signal enemy_phase

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("next phase"):
		next_phase()

#changes phase
func next_phase():
	phase += 1
	if phase > phase_max:
		phase = 1
		next_turn.emit()
	if phase == 1:
		turn += 1
		card_phase.emit()
		phase_name = "Card Phase"
	elif phase == 2:
		dice_phase.emit()
		phase_name = "Dice Phase"
	elif phase == 3:
		enemy_phase.emit()
		phase_name = "Enemy Phase"
	print("Turn ", turn, " Phase ", phase, ": ", phase_name)
