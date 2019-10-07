extends KinematicBody2D

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
	pass 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	update_sprite_and_move(delta)
	pass

func _input(event):
	if Input.is_action_just_pressed("ui_food"):
		var size = global.itemsFoundSize
		if (size > 0):
			var rng = RandomNumberGenerator.new()
			rng.randomize()
			var rand = rng.randi_range(0,size-1)
			var it = global.itemsFound[rand]
			if (it != "Old Magazine" and it != "Music Player" 
				and it != "Flashlight"):
				consume(global.itemsFound[rand])
				global.itemsFound.erase(global.itemsFound[rand])
				global.itemsFoundSize -= 1
			else:
				global.dialogAppend("You tried to eat something inedible")
				
func consume(item):
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	global._on_event_hunger(rng.randi_range(-5, 20))
	global._on_event_happy(rng.randi_range(-5, 20))
	global._on_event_immunity(rng.randi_range(-5, 20))
	global._on_event_thirst(rng.randi_range(-5, 20))
	global._on_event_tired(rng.randi_range(-5, 20))
	global._on_event_hp(rng.randi_range(-5, 20))
	global.dialogAppend("You consumed a " + item + "!")
	pass

func update_sprite_and_move(delta):
	
	
	button_action("ui_right", Vector2(1, 0))
	button_action("ui_left", Vector2(-1, 0))
	button_action("ui_up", Vector2(0, -1))
	button_action("ui_down", Vector2(0, 1))
		
	if vecMove.x != 0 or vecMove.y != 0:
		global.is_working = true
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
		global.is_working = false
		if movement == "moveDown": movement = "idleDown"
		elif movement == "moveUp": movement = "idleUp"
		elif movement == "moveRight": movement = "idleRight"
		elif movement == "moveLeft": movement = "idleLeft"
	ANI.play(movement)
	pass

# Auxiliary function
func button_action(action, vec):
	if Input.is_action_just_pressed(action):
		vecMove += vec
	if Input.is_action_just_released(action):
		vecMove -= vec
	pass