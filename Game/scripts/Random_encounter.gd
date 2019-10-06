extends Node

# Declare member variables here. Examples:
var encounter_type = ""
var chance_to_disaster = 0.0
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _init(type, chance):
	encounter_type = type
	chance_to_disaster = chance
	disaster = 0
	x = rand_range(0,2)
	if x > chance_to_disaster:
		disaster = 1
	else:
		disaster = -1
	match encounter_type:
		"item":
			#finds random item
		"hunger":
			global.hunger = #adicionar número aleatório multiplicado por disaster
			#affects hunger meter
		"thirst":
			#affects thirst meter
		"happiness":
			#afects happiness meter
		"health":
			#afects health points
		"immunity":
			#afects infection ratio
		"toxicity":
			#affects infection total
		
