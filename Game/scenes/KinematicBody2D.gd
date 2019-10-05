extends KinematicBody2D


# Character properties
var toxicity
var immunity
var hunger
var thirst
var tired
var hp
var happy
#var sanity

# Animation variables
onready var ANI = get_node("AnimationPlayer")
var movement #store the direction of the player
var vecMove #store the movement of the player
var SPEED = 150 #speed ratio

# Called when the node enters the scene tree for the first time.
func _ready():
	movement = "idleDown"
	vecMove = Vector2(0, 0)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	update_sprite_and_move(delta)
	pass
	

func update_sprite_and_move(delta):
	button_action("ui_right", Vector2(1, 0))
	button_action("ui_left", Vector2(-1, 0))
	button_action("ui_up", Vector2(0, -1))
	button_action("ui_down", Vector2(0, 1))
		
	if vecMove.x != 0 or vecMove.y != 0:
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
		if movement == "moveDown": movement = "idleDown"
		elif movement == "moveUp": movement = "idleUp"
		elif movement == "moveRight": movement = "idleRight"
		elif movement == "moveLeft": movement = "idleLeft"
	ANI.play(movement)
	pass
	
func button_action(action, vec):
	if Input.is_action_just_pressed(action):
		vecMove += vec
	if Input.is_action_just_released(action):
		vecMove -= vec
	pass