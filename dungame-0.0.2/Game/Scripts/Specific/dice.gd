extends Node2D

signal rolled
var ind_damage = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#get_parent().get_parent().card_phase.connect() # May become useful later
	get_parent().get_parent().dice_phase.connect(roll_dice) # Tells the dice when it's time to roll
	#get_parent().update_damage.connect(damage_update)
	#get_parent().get_parent().enemy_phase.connect() # May become useful later
	#get_parent().get_parent().next_turn.connect() # May become useful later


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func roll_dice():
	ind_damage = randi_range(0,5) + 1
	$Area2D/AnimatedSprite2D.set_frame(ind_damage - 1)
	get_parent().damage_array.append(ind_damage)
	rolled.emit()
