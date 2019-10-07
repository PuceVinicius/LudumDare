extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _input(event):
	if Input.is_action_just_pressed("ui_interact"):
		var bodies = $collider.get_overlapping_bodies()
		for b in bodies:
			if b.name == "Birina":
				show_chest_interactions()
	pass # Replace with function body.
	
func show_chest_interactions():
	
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
