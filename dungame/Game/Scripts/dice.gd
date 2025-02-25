extends Node2D

var roll_array

var dice
var roll_amount
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_tree().current_scene.dice_phase.connect(roll)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	

func roll() -> void:
	roll_array = get_parent().dice_rolls
	dice = randi_range(0,5)
	roll_amount = dice + 1
	print("I WORK: ", roll_amount)
	$"Area2D/Dice sides".set_frame(dice)
	roll_array.append(roll_amount)
	pass
