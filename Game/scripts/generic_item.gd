extends RigidBody2D

export var size = 1
export var ammount = 1
export var item_type = "food"

func _input(event): #for when it is being picked up
	if Input.is_action_just_pressed("ui_interact"): # is E pressed?
		var bodies = $Detector.get_overlapping_bodies() #checks if player is in the colision box range

		for b in bodies:
			if b.name == "Birina" and get_node("..").bag_size + size <= get_node("..").bag_max_size:
				get_node("..").bag_size += size #increase bag current size

				if get_node("..").bag_size == get_node("..").bag_max_size: # checks if bag is now full
					get_node("..").bag_is_full = true

				print("You found a Bread")
				print("Bread stored in Bag at Food Pocket")

				queue_free() # vanishes