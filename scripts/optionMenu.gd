extends Node


var stage


func _on_VButtonArray_button_selected( button_idx ):
	stage = user_data_manager.get_data("world")
	if button_idx == 0:
		transition.fade_to("res://scenes/levelSelect.tscn")
	elif button_idx == 1 and stage == 2:
		pass
	elif button_idx == 2 and stage == 3:
		pass
	elif button_idx == 3 and stage == 4:
		pass
	elif button_idx == 4 and stage == 5:
		pass
	else:
		get_node("Warning").show()


func _on_Button_pressed():
	get_node("Warning").hide()

	


func _on_Menu_pressed():
	transition.put_above("res://scenes/Menu.tscn")
