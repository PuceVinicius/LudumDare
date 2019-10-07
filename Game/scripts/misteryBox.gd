extends Area2D

var randItem
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func _ready():
	randItem = global.get_random_item()

# Called when the node enters the scene tree for the first time.
func _input(event):
	if Input.is_action_just_pressed("ui_interact"):
		var bodies = self.get_overlapping_bodies()
		for b in bodies:
			if b.name == "Character":
				show_message(randItem)
				if randItem != null:
					global.itemsFound.append(randItem)
					if randItem == "Old Magazine": global.itemOld = true
					if randItem == "Flashlight": global.itemFlash = true
					if randItem == "Music Player": global.itemMusic = true
					randItem = null
					global.itemsFoundSize += 1
	pass # Replace with function body.
	
func show_message(randItem):
	if randItem != null:
		global.dialogAppend("Congratulation! You have found " + randItem + "!!")
	else:
		global.dialogAppend("No items left")
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
