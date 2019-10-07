extends KinematicBody2D

# HUD signals
signal sig_tox
signal sig_imm
signal sig_hun
signal sig_thi
signal sig_tir
signal sig_hp
signal sig_hap

# Character properties
var toxicity
var immunity
var hunger
var thirst
var tired
var hp
var happy
var is_working = false
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

# Animation variables
onready var ANI = get_node("AnimationPlayer")
var movement #store the direction of the player
var vecMove #store the movement of the player
var SPEED = 150 #speed ratio

# Called when the node enters the scene tree for the first time.
func _ready():
	# Initial Movement
	movement = "idleDown"
	vecMove = Vector2(0, 0)
	
	# Initial Base Status
	toxicity = 0
	immunity = 50
	hunger = 100
	thirst = 100
	tired = 100
	hp = 100
	happy = 100
	is_working = false
	
	pass 

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

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	update_sprite_and_move(delta)
	update_hunger(delta)
	update_thirst(delta)
	update_tired(delta)
	update_happy(delta)
	pass
	

func update_sprite_and_move(delta):
	
	button_action("ui_right", Vector2(1, 0))
	button_action("ui_left", Vector2(-1, 0))
	button_action("ui_up", Vector2(0, -1))
	button_action("ui_down", Vector2(0, 1))
		
	if vecMove.x != 0 or vecMove.y != 0:
		is_working = true
		self.move_and_collide(vecMove*delta*SPEED)
		if vecMove.y > 0:
			movement = "moveDown"
		elif vecMove.y < 0:
			movement = "moveUp"
		elif vecMove.x > 0:
			movement = "moveRight"
		elif vecMove.x < 0:
			movement = "moveLeft"
	else:
		is_working = false
		if movement == "moveDown": movement = "idleDown"
		elif movement == "moveUp": movement = "idleUp"
		elif movement == "moveRight": movement = "idleRight"
		elif movement == "moveLeft": movement = "idleLeft"
	ANI.play(movement)
	pass
	
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

# Auxiliary function
func button_action(action, vec):
	if Input.is_action_just_pressed(action):
		vecMove += vec
	if Input.is_action_just_released(action):
		vecMove -= vec
	pass