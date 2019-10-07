extends RichTextLabel

onready var TIMER = get_node("Timer2")

func _ready():
	global.connect("sig_dialog", self, "_on_Root_sig_dialog")
	set_bbcode(global.dialog[global.page])
	set_visible_characters(0)
	set_process_input(true)
	
	TIMER.wait_time = 3
	TIMER.autostart = false
	TIMER.one_shot = true
	pass 

func _input(event):
	if event is InputEventMouseButton and event.is_pressed():
		if get_visible_characters() > get_total_character_count():
			if global.page < global.dialog.size()-1:
				global.page += 1
				set_bbcode(global.dialog[global.page])
				set_visible_characters(0)
		else:
			set_visible_characters(get_total_character_count())

func _on_Root_sig_dialog(string):
	self.visible = true
	var node = get_parent()
	node.visible = true
	set_bbcode(string)
	set_visible_characters(0)
	TIMER.start()
	

func _on_Timer_timeout():
	set_visible_characters(get_visible_characters()+1)
	pass # Replace with function body.


func _on_Timer2_timeout():
	self.visible = false
	var node = get_parent()
	node.visible = false
	pass # Replace with function body.
