extends Node2D

var dice
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_parent().dice_phase.connect(roll)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	

func roll() -> void:
	dice = randi_range(0,5)
	print("I WORK: ", dice + 1)
	$"Area2D/Dice sides".set_frame(dice)
	pass
