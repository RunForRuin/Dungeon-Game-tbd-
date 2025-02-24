extends Node2D

var dice
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_parent().connect("roll_dice", roll)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	

func roll() -> void:
	dice = randi_range(0,5)
	print("I WORK: ", dice)
	$"Area2D/Dice shape/Dice sides".frame = dice
	pass
