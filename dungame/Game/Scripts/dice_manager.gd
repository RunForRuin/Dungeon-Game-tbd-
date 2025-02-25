extends Node2D

var dice_number = 0
const dice_path = preload("res://Game/Scenes/dice.tscn") #the path for the dice (to instantiate)

var dice_rolls : Array[int] = [] #contains the results of each dice roll
var dice_rolls_sum = 0
@export var damage : String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_parent().enemy_phase.connect(reset_dice_rolls) #resets dice_rolls array on enemy_phase
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Spawn Dice (temporary)"): #when press "1"
		spawn_dice()
	if (Input.is_action_just_pressed("print (debug)")):
		sum_dice_rolls(dice_rolls)
		print("all rolls: ",dice_rolls, ", Total: ", dice_rolls_sum)


#spawns dice (temporary debug)
func spawn_dice() -> void:
	dice_number += 1
	var dice = dice_path.instantiate()
	add_child(dice)
	dice.position = get_local_mouse_position()
	print("Dice #",dice_number, " spawned B)")

func sum_dice_rolls(dice_rolls): #gets the sum of dice rolls - attack damage
	dice_rolls_sum = 0
	for i in dice_rolls:
		dice_rolls_sum += i
		damage = str(dice_rolls_sum) #for exporting the "total" as a string
	return dice_rolls_sum
	


func reset_dice_rolls() -> void: #the function that resets the dice_rolls array
	dice_rolls.clear()
