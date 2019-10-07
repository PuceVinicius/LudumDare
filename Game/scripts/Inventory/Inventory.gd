extends Node2D

onready var food_pocket = get_node("Foods Pocket")
onready var drinks_pocket = get_node("Drinks Pocket")
onready var med_pocket = get_node("Medical Pocket")
onready var key_pocket = get_node("Key Items Pocket")

export var bag_size = 0
export var bag_max_size = 1000
export var bag_is_full = false

func take_item(item):
	if bag_size + item.size < bag_max_size:
		bag_size += item.size
	else:
		return false
	pass

func _input(event): #for when it is being picked up
	if Input.is_action_just_pressed("ui_interact"): # is E pressed?
		food_pocket.food_can._update_status()