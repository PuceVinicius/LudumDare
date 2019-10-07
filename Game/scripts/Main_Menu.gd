extends Panel

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Quit_Button_pressed():
	get_tree().quit()


func _on_Options_Button_pressed():
	get_tree().change_scene("res://scenes/Options_Menu.tscn")


func _on_New_Game_Button_pressed():
	get_tree().change_scene("res://scenes/map.tscn")
	pass # Replace with function body.
