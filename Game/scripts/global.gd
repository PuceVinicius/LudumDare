extends Node

# Declare member variables here. Examples:
var toxicity
var immunity
var hunger
var thirst
var tired
var hp
var happy
var is_working
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

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
