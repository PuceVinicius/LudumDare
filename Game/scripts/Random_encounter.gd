extends Node

# Declare member variables here. Examples:
var encounter_type = ""
var disaster = false
var chance_of_disaster = 0.0
var encounter_attribute = ""
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _init(type, chance):
	encounter_type = type
	chance_of_disaster = chance
	var x = rand_range(0,6)
	match x:
		0:
			encounter_attribute = "item"
		1:
			encounter_attribute = "hunger"
		2:
			encounter_attribute = "thirst"
		3:
			encounter_attribute = "happiness"
		4:
			encounter_attribute = "health"
		5:
			encounter_attribute = "immunity"
		6:
			encounter_attribute = "toxicity"
	
func generate(min_mod, max_mod):
	var rng = RandomNumberGenerator.new()
	var mod = rng.randi_range(min_mod, max_mod)
	
	var x = rng.randf()
	if x > self.chance_to_disaster:
		disaster = true
		mod = mod *(-1)
	else:
		disaster = false
	
	match encounter_attribute:
		"item":
			var socorro = true
			#finds random item
		"hunger":
			global.hunger += mod #adicionar número aleatório multiplicado por disaster
			#affects hunger meter
		"thirst":
			global.thirst += mod
			#affects thirst meter
		"happiness":
			global.happy += mod
			#afects happiness meter
		"health":
			global.hp += mod
			#afects health points
		"immunity":
			global.immunity += mod
			#afects infection ratio
		"toxicity":
			global.toxicity += abs(mod)
			#affects infection total
			
func event_choice(mod):
	var s = ""
	var x = -1
	var rng = RandomNumberGenerator.new()
	
	match encounter_attribute:
		"hunger":
			if disaster == true:
				var hunger_bad = []
				s = "You ate some leftover food only to found it was rotten and lost " + str(mod) + " hunger."
				hunger_bad.append(s)
				x = rng.randi_range(0, hunger_bad.size()-1)
				return hunger_bad[x]
			else:
				var hunger_good = []
				s = "You found a small berry garden and regained " + str(mod) + " hunger!"
				hunger_good.append(s)
				s = "You found a hidden food stash and regained " + str(mod) + " hunger!"
				hunger_good.append(s)
				s = "You found some canned food and regained " + str(mod) + " hunger!"
				hunger_good.append(s)
				
				x = rng.randi_range(0, hunger_good.size()-1)
				return hunger_good[x]
		"thirst":
			if disaster == true:
				var thirst_bad =[]
				s = "Searching and walking around made you especially dehidrated and you lost " + str(mod) + " thirst."
				thirst_bad.append(s)
				s = "The sight of a dead body inside the house made you throw up and you lost " + str(mod) + " thirst."
				thirst_bad.append(s)
				s = "The sun is shining too bright and made you dehidrated, losing " + str(mod) + " thirst."
				thirst_bad.append(s)
				
				x = rng.randi_range(0, thirst_bad.size()-1)
				return thirst_bad[x]
			else:
				var thirst_good = []
				s = "You found some juicy fruits and regained " + str(mod) + " thirst!"
				thirst_good.append(s)
				s = "You drank some collected rain water and regained " + str(mod) + " thirst!"
				thirst_good.append(s)
				
				x = rng.randi_range(0, thirst_good.size()-1)
				return thirst_good[x]
		"happiness":
			if disaster == true:
				var happiness_bad = []
				s = "Remembering the loved ones you lost to the Plague left you gloomy and you lost " + str(mod) + " happiness."
				happiness_bad.append(s)
				s = "You got hit by the existencial dread of the apocalypse and lost " + str(mod) + " happiness."
				happiness_bad.append(s)
				
				x = rng.randi_range(0, happiness_bad.size()-1)
				return happiness_bad[x]
			else:
				var happiness_good = []
				s = "You found some tasty candy and regained " + str(mod) + " happiness!"
				happiness_good.append(s)
				s = "You read some old joke book and regained " + str(mod) + " happiness!"
				happiness_good.append(s)
				
				x = rng.randi_range(0, happiness_good.size()-1)
				return happiness_good[x]
		"health":
			if disaster == true:
				var health_bad = []
				s = "You were bitten by a wild raccoon and lost " + str(mod) + " health."
				health_bad.append(s)
				s = "You cut yourself on glass shards and lost " + str(mod) + " health."
				health_bad.append(s)
				
				x = rng.randi_range(0, health_bad.size()-1)
				return health_bad[x]
			else:
				var health_good = []
				s = "You found some leftover medication and regained " + str(mod) + " health."
				health_good.append(s)
				s = "You found medicinal herbs and regained " + str(mod) + " health." 
				health_good.append(s)
				
				x = rng.randi_range(0, health_good.size()-1)
				return health_good[x]
		"immunity":
			if disaster == true:
				var immunity_bad = []
				s = "You exerted yourself too much and lost " + str(mod) + " immunity." 
				immunity_bad.append(s)
				s = "You caught a cold and lost " + str(mod) + " immunity." 
				immunity_bad.append(s)
				
				x = rng.randi_range(0, immunity_bad.size()-1)
				return immunity_bad[x]
			else:
				var immunity_good = []
				s = "You found some antibiotics and regained " + str(mod) + " immunity!"
				immunity_good.append(s)
				
				x = rng.randi_range(0, immunity_good.size()-1)
				return immunity_good[x]
		"toxicity":
			var toxicity_bad = []
			s = "The area has been lightly affected by the plague and you gained " + str(mod) + " toxicity."
			toxicity_bad.append(s)
			
			x = rng.randi_range(0, toxicity_bad.size()-1)
			return toxicity_bad[x]
		
