extends Node2D

# Declare member variables here. Examples:
var toxicity = 0
var immunity = 0
var hunger = 0
var thirst = 0
var tired = 0
var hp = 0
var happy = 0
var is_working = 0
#var sanity

# Timers

var hunger_timer = 15
var thirst_timer = 10
var tired_timer = 10
var happy_timer = 15
# --
var hunger_cd = 0
var thirst_cd = 0
var tired_cd = 0
var happy_cd = 0

#inventory variables
var bag_size = 0
var bag_max_size = 100
var bag_is_full = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event): #for when it is being picked up
	if Input.is_action_just_released("ui_open_menu"):
		print("You've got ", bag_size, " breads OOOO")