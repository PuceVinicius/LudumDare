extends RigidBody2D

export var size = 1
export var ammount = 1
export var item_type = "food"
export var usability = 1

var is_picked = true #interacts with Bag_is_full
#export var sell_price = 1


func _physics_process(delta): # FEATURE: PICKUP ITEM ANIMATION
	#print(self.position)
	if is_picked == true:
		#self.position = get_node("../Player1/Position2D").global_position
		sleeping = true
	else:
		sleeping = false

func _input(event): #for when it is being picked up
	#if Input.is_action_just_pressed("ui_open_menu"):
	#	print("You've got ", get_node("..").bag_size, " breads")

	if Input.is_action_just_pressed("ui_interact"):
		#print("vc apertou e")
		var bodies = $Detector.get_overlapping_bodies()
		for b in bodies:
			if b.name == "player" and get_node("..").bag_size + size <= get_node("..").bag_max_size:
				is_picked = true
				get_node("..").bag_size += size
				if get_node("..").bag_size == get_node("..").bag_max_size:
					get_node("..").bag_is_full = true
				print("You found a Bread")
				print("Bread stored in Bag at Food Pocket")
				queue_free()
		
	