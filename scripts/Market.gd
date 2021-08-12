extends Node2D


func _ready():
	set_process_input(true)
	
func _input(event):
	get_node("CoinLabel").set_text(str(user_data_manager.get_data("coins")))

func _on_BackButton_pressed():
	transition.clear_above()


func _on_Item_btnPressed():
	get_node("Warning").show()
	


func _on_Button_pressed():
	
	if user_data_manager.get_data("coins") >= 30:
		user_data_manager.set_data("hearts", user_data_manager.get_data("hearts")+1)
		user_data_manager.set_data("coins", user_data_manager.get_data("coins")-30)
		user_data_manager.save_data()
		get_node("Warning").hide()
		get_node("Label").set_text(str(user_data_manager.get_data("coins")))
	else:
		get_node("Warning").hide()
		get_node("Warning2").show()


func _on_Button_2_pressed():
	get_node("Warning").hide()


func _on_ok_pressed():
	get_node("Warning2").hide()





func _on_Item2_btnPressed():
	pass # replace with function body


func _on_Item3_btnPressed():
	pass # replace with function body


func _on_Item4_btnPressed():
	pass # replace with function body
