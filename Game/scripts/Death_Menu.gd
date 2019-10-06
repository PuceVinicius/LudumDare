extends Panel

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _init(cause):
	death(cause)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func death(cause):
	var Death_Message = get_node("Background_Container/VBoxContainer/Death_Message")
	match cause:
		"hunger":
			Death_Message.set_text("Passou fome")
		"thirst":
			Death_Message.set_text("Passou sede")
		"depression":
			Death_Message.set_text("Chorou no banho")
	pass




func _on_Retry_Button_pressed():
	pass # Replace with function body.


func _on_Main_Menu_Button_pressed():
	get_tree().change_scene("res://scenes/Menu.tscn")


func _on_Quit_Button_pressed():
	get_tree().quit()
