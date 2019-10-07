extends Area2D

# Called when the node enters the scene tree for the first time.
func _input(event):
	if Input.is_action_just_pressed("ui_interact"):
		var bodies = self.get_overlapping_bodies()
		for b in bodies:
			if b.name == "Character":
				if (global.itemFlash == true and global.itemMusic == true
					and global.itemOld == true):
					global.dialogAppend("CONGRATULATION, YOU WON!!")
				else:
					global.dialogAppend("Some items are still missing :(")
	pass # Replace with function body.
	