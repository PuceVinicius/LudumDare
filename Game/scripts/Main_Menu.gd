extends Node2D

var settings_button
var quit_button

func _ready():
	settings_button = get_node("Panel/Settings Warning")
	quit_button = get_node("Panel/Quit Text")

func _on_Start_pressed():
	get_tree().change_scene("res://scenes/map.tscn")

func _on_Settings_pressed():
	settings_button.show()

func _on_Kill_pressed():
	get_tree().quit()

func _on_Back_pressed():
	settings_button.hide()

func _on_Quit_pressed():
	quit_button.show()