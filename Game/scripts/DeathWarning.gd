extends Node2D

var death

# Called when the node enters the scene tree for the first time.
func _ready():
	death = get_node("Death")
	global.connect("sig_thi_death", self, "_on_Root_sig_thi_death")
	global.connect("sig_tir_death", self, "_on_Root_sig_tir_death")

func _on_Root_sig_thi_death():
	get_tree().change_scene("res://scenes/DeathWarning.tscn")
	death.show()

func _on_Root_sig_tir_death():
	get_tree().change_scene("res://scenes/DeathWarning.tscn")
	death.show()

func _on_TextureButton2_pressed():
	get_tree().change_scene("res://scenes/MainMenu.tscn")


func _on_ded_button_pressed():
	get_tree().change_scene("res://scenes/MainMenu.tscn")