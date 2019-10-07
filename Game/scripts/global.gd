extends Node2D

# HUD signals
signal sig_tox
signal sig_imm
signal sig_hun
signal sig_thi
signal sig_tir
signal sig_hp
signal sig_hap

export var toxicity = 0
export var immunity = 100
export var hunger = 100
export var thirst = 100
export var tired = 100
export var hp = 100
export var happy = 100
export var is_working = false

# Timers
export var hunger_timer = 4.5
export var thirst_timer = 3.0
export var tired_timer = 3.0
export var happy_timer = 4.5

# --
export var hunger_cd = 0
export var thirst_cd = 0
export var tired_cd = 0
export var happy_cd = 0

# Random Items definition
export var items = ["Food Can", "Bread", "Candy", "Meat", "Water", "Juice", "Soda",
				    "Beer", "Medical Herb", "Bandages", "Antibiotics", "First Aid Kit", 
					"Umbrella", "Flashlight", "Music Player", "Old Magazine", "Fishing Rod",
					"Food Can", "Bread", "Candy", "Meat", "Water", "Juice", "Soda",
				    "Beer", "Medical Herb", "Bandages", "Antibiotics", "First Aid Kit",
					"Food Can", "Bread", "Candy", "Meat", "Water", "Juice", "Soda",
				    "Beer", "Medical Herb", "Bandages", "Antibiotics", "First Aid Kit"]
export var itemsSize = 41

# Items with the character
export var itemsFound = []
export var itemsFoundSize = 0
export var itemFlash = false
export var itemOld = false
export var itemMusic = false

func _ready():
	emit_signal("sig_tox", toxicity)
	emit_signal("sig_imm", immunity)
	emit_signal("sig_hun", hunger)
	emit_signal("sig_thi", thirst)
	emit_signal("sig_tir", tired)
	emit_signal("sig_hp", hp)
	emit_signal("sig_hap", happy)
	pass
	

func _process(delta):
	update_hunger(delta)
	update_thirst(delta)
	update_tired(delta)
	update_happy(delta)
	pass

func get_random_item():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	if itemsSize == 0:
		return null
	var index = rng.randi_range(0, itemsSize-1)
	var item = items[index]
	var tempItem = items[itemsSize-1]
	items[itemsSize-1] = items[index]
	items[index] = tempItem
	itemsSize -= 1
	return item

# Using itens
func _on_event_toxicity(amount):
	toxicity = minmax_calc(toxicity, amount)
	emit_signal("sig_tox", toxicity)
	#if toxicity == 100:
		#MORREU
	pass
	
func _on_event_immunity(amount):
	immunity = minmax_calc(immunity, amount)
	emit_signal("sig_imm", immunity)
	pass
	
func _on_event_hunger(amount):
	hunger = minmax_calc(hunger, amount)
	emit_signal("sig_hun", hunger)
	if hunger == 0:
		critical_hunger()
	pass
	
func _on_event_thirst(amount):
	thirst = minmax_calc(thirst, amount)
	emit_signal("sig_thi", thirst)
	if thirst == 0:
		critical_thirst()
	pass
	
func _on_event_tired(amount):
	tired = minmax_calc(tired, amount)
	emit_signal("sig_tir", tired)
	if tired == 0:
		critical_tired()
	pass
	
func _on_event_hp(amount):
	hp = minmax_calc(hp, amount)
	emit_signal("sig_hp", hp)
	#if hp == 0:
		#MORREU
	pass
	
func _on_event_happy(amount):
	happy = minmax_calc(happy, amount)
	emit_signal("sig_hap", happy)
	if happy == 0:
		critical_happy()
	pass

# Auxiliary function
func minmax_calc(prop, amount):
	return max(0, min(prop+amount, 100))
	
func update_hunger(delta):
	if cooldown_reached(hunger_cd, hunger_timer, delta, 2):
		hunger_cd -= hunger_timer
		hunger -= 1
		emit_signal("sig_hun", hunger)
		if hunger == 0:
			critical_hunger()
	else:
		hunger_cd = cooldown_not_reached(hunger_cd, delta, 2)
	pass	
	
func update_thirst(delta):
	if cooldown_reached(thirst_cd, thirst_timer, delta, 3):
		thirst_cd -= thirst_timer
		thirst -= 1
		emit_signal("sig_thi", thirst)
		if thirst == 0:
			critical_thirst()
	else:
		thirst_cd = cooldown_not_reached(thirst_cd, delta, 3)
	pass
	
func update_tired(delta):
	if cooldown_reached(tired_cd, tired_timer, delta, 4):
		tired_cd -= tired_timer
		tired -= 1
		emit_signal("sig_tir", tired)
		if tired == 0:
			critical_tired()
	else:
		tired_cd = cooldown_not_reached(tired_cd, delta, 4)
	pass
	
func update_happy(delta):
	if cooldown_reached(happy_cd, happy_timer, delta, 0.5):
		happy_cd -= happy_timer
		happy -= 1
		emit_signal("sig_hap", happy)
		if happy == 0:
			critical_happy()
	else:
		happy_cd = cooldown_not_reached(happy_cd, delta, 0.5)
	pass

func critical_hunger():
	pass

func critical_thirst():
	pass

func critical_tired():
	pass

func critical_happy():
	pass

# Auxiliary function
func cooldown_reached(cd, timer, delta, mode_working):
	var mode = 1
	if is_working:
		mode = mode_working
	cd += delta*mode
	if cd > timer:
		return true
	else:
		return false
	pass

func cooldown_not_reached(cd, delta, mode_working):
	var mode = 1
	if is_working: mode = mode_working
	return cd + delta*mode

	