extends Node2D

export var toxicity_mod = 8
export var immunity_mod = 5
export var hunger_mod = 20
export var thirst_mod = 2
export var tired_mod = -5
export var hp_mod = 5
export var happy_mod = -5

func _update_status():
	get_node("/root/global").toxicity += toxicity_mod
	get_node("/root/global").immunity += immunity_mod
	get_node("/root/global").hunger += hunger_mod
	get_node("/root/global").thirst += thirst_mod
	get_node("/root/global").tired += tired_mod
	get_node("/root/global").hp += hp_mod
	get_node("/root/global").happy += happy_mod
	#print(get_node("/root/global").toxicity)