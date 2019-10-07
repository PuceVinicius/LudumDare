extends Node2D

onready var TIM = get_node("Timer")
var pp = true

# Called when the node enters the scene tree for the first time.
func _ready():
	global.connect("sig_thi_death", self, "_on_Root_sig_thi_death")
	global.connect("sig_tir_death", self, "_on_Root_sig_tir_death")
	TIM.autostart = false
	TIM.one_shot = true
	TIM.wait_time = 3 

func _on_Root_sig_thi_death():
	get_tree().change_scene("res://scenes/DeathWarning.tscn")
	if pp == true: 
		TIM.start()
		pp = false

func _on_Root_sig_tir_death():
	get_tree().change_scene("res://scenes/DeathWarning.tscn")
	if pp == true: 
		TIM.start()
		pp = false

func _on_TextureButton2_pressed():
	get_tree().change_scene("res://scenes/MainMenu.tscn")


func _on_ded_button_pressed():
	get_tree().change_scene("res://scenes/MainMenu.tscn")

func _on_ded_button_button_down():
	get_tree().change_scene("res://scenes/MainMenu.tscn")
	pass # Replace with function body.


func _on_Timer_timeout():
	get_tree().quit()
	pass # Replace with function body.
