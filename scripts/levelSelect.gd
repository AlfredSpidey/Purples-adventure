extends Node
var level
var purplemusic = transition.get_node("PurpleMusic")
var numb = transition.get_node("Numb")
var savedata = {"level1": 0,
				"level2": -1,
				"level3": -1,
				"level4": -1,
				"level5": -1}
func _ready():
	level = user_data_manager.get_data("score1")
	get_node("levels/Level/lock").set_texture(load("res://assets/level.png"))
	if level == 1:
		get_node("levels/Level 2/lock").set_texture(load("res://assets/level.png"))
		savedata["level2"] = 0
	else:
		get_node("levels/Level 2/lock").set_texture(load("res://assets/level_lock.png"))
	if level == 2:
		get_node("levels/Level 2/lock").set_texture(load("res://assets/level.png"))
		get_node("levels/Level 3/lock").set_texture(load("res://assets/level.png"))
		savedata["level2"] = 0
		savedata["level3"] = 0
	else:
		get_node("levels/Level 3/lock").set_texture(load("res://assets/level_lock.png"))
	if level == 3:
		get_node("levels/Level 2/lock").set_texture(load("res://assets/level.png"))
		get_node("levels/Level 3/lock").set_texture(load("res://assets/level.png"))
		get_node("levels/Level 4/lock").set_texture(load("res://assets/level.png"))
		savedata["level2"] = 0
		savedata["level3"] = 0
		savedata["level4"] = 0
	else:
		get_node("levels/Level 4/lock").set_texture(load("res://assets/level_lock.png"))
	if level == 4:
		get_node("levels/Level 2/lock").set_texture(load("res://assets/level.png"))
		get_node("levels/Level 3/lock").set_texture(load("res://assets/level.png"))
		get_node("levels/Level 4/lock").set_texture(load("res://assets/level.png"))
		get_node("levels/Level 5/lock").set_texture(load("res://assets/level.png"))
		savedata["level2"] = 0
		savedata["level3"] = 0
		savedata["level4"] = 0
		savedata["level5"] = 0
	else:
		get_node("levels/Level 5/lock").set_texture(load("res://assets/level_lock.png"))
		

func _on_Level_input_event( viewport, event, shape_idx ):
	if event.type == InputEvent.SCREEN_TOUCH and event.pressed:
		get_node("levels/Level/lock").set_texture(load("res://assets/level_lock.png"))
		transition.fade_to("res://scenes/game.tscn")
		purplemusic.stop()
		numb.play()


func _on_Level_2_input_event( viewport, event, shape_idx ):
	if event.type == InputEvent.SCREEN_TOUCH and event.pressed and savedata["level2"]==0:
		get_node("levels/Level 2/lock").set_texture(load("res://assets/level_lock.png"))
		transition.fade_to("res://scenes/game2.tscn")


func _on_Level_3_input_event( viewport, event, shape_idx ):
	if event.type == InputEvent.SCREEN_TOUCH and event.pressed and savedata["level3"]==0:
		get_node("levels/Level 3/lock").set_texture(load("res://assets/level_lock.png"))
		transition.fade_to("res://scenes/game3.tscn")


func _on_Level_4_input_event( viewport, event, shape_idx ):
	if event.type == InputEvent.SCREEN_TOUCH and event.pressed and savedata["level4"]==0:
		get_node("levels/Level 4/lock").set_texture(load("res://assets/level_lock.png"))
		transition.fade_to("res://scenes/game4.tscn")


func _on_Level_5_input_event( viewport, event, shape_idx ):
	if event.type == InputEvent.SCREEN_TOUCH and event.pressed and savedata["level5"]==0:
		get_node("levels/Level 5/lock").set_texture(load("res://assets/level_lock.png"))
		transition.fade_to("res://scenes/game5.tscn")

func _on_BackButton_pressed():
	transition.fade_to("res://scenes/optionMenu.tscn")