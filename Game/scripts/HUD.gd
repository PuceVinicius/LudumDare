extends MarginContainer

onready var HP = get_node("Lines/HP/HPline/HP_label")
onready var TOX = get_node("Lines/Tox_Imm/HPline2/Tox_label")
onready var IMM = get_node("Lines/Tox_Imm/HPline2/HPline3/Imm_label")
onready var HUN = get_node("Lines/Hun_Thi/Hun/Hun_label")
onready var THI = get_node("Lines/Hun_Thi/Hun/Thi/Thi_label")
onready var HAP = get_node("Lines/Hap_Tir/Hap/Hap_Label")
onready var TIR = get_node("Lines/Hap_Tir/Hap/Tir/Tir_Label")

func _ready():
    global.connect("sig_hap", self, "_on_Root_sig_hap")
    global.connect("sig_hp", self, "_on_Root_sig_hp")
    global.connect("sig_hun", self, "_on_Root_sig_hun")
    global.connect("sig_imm", self, "_on_Root_sig_imm")
    global.connect("sig_thi", self, "_on_Root_sig_thi")
    global.connect("sig_tir", self, "_on_Root_sig_tir")
    global.connect("sig_tox", self, "_on_Root_sig_tox")

func _on_Root_sig_hap(value):
	HAP.text = str(value)
	pass # Replace with function body.


func _on_Root_sig_hp(value):
	HP.text = str(value)
	pass # Replace with function body.


func _on_Root_sig_hun(value):
	HUN.text = str(value)
	pass # Replace with function body.


func _on_Root_sig_imm(value):
	IMM.text = str(value)
	pass # Replace with function body.


func _on_Root_sig_thi(value):
	THI.text = str(value)
	pass # Replace with function body.


func _on_Root_sig_tir(value):
	TIR.text = str(value)
	pass # Replace with function body.


func _on_Root_sig_tox(value):
	TOX.text = str(value)
	pass # Replace with function body.
