extends Node2D

signal update_damage
var damage_array : Array[int] = []
var damage = 0

@onready var dice_path = preload("res://Game/Scenes/dice.tscn")
var dice_amnt = 0
var newest_dice
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_parent().dice_phase.connect(connect_dice)
	get_parent().enemy_phase.connect(reset_rolls)
	update_damage.connect(get_damage)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if Input.is_action_just_pressed("spawn dice (debug)"):
		spawn_dice()
	if Input.is_action_just_pressed("print (debug)"):
		print(damage_array, " and ", damage)
	if Input.is_action_just_pressed("Debug action"):
		pass

func spawn_dice() -> void: #temporary for debug
	dice_amnt += 1
	var dice_spawn = dice_path.instantiate()
	add_child(dice_spawn)
	dice_spawn.position = get_local_mouse_position()
	print("Dice #",dice_amnt, " spawned B)")
	connect_dice()

func get_damage(damage_array):
	damage = 0
	for die in damage_array:
		damage += die
	update_damage.emit()
	return damage
	#print(damage_array)

func connect_dice() -> void: #connects the signal "rolled" from all spawned dice
	var dice_group = get_tree().get_nodes_in_group("dice")
	for dice in dice_group:
		dice.rolled.connect(test) 



func reset_rolls() -> void: #resets damage
	damage_array.clear()

func test():
	get_damage(damage_array)
