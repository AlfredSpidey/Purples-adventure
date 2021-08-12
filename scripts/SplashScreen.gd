extends Node

func _ready():
	set_process_input(true)

func _input(event):
	if event.type == InputEvent.SCREEN_TOUCH and event.is_pressed():
		transition.fade_to("res://scenes/CenaInicial.tscn")

func _on_Timer_timeout():
	transition.fade_to("res://scenes/CenaInicial.tscn")
