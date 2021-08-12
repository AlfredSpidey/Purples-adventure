extends Node



func _on_play_pressed():
	if user_data_manager.get_data("coins") > 999:
		user_data_manager.set_data("coins", 999)
		user_data_manager.save_data()
	transition.fade_to("res://scenes/optionMenu.tscn")
