extends Node2D

var purplemusic = transition.get_node("PurpleMusic")
var musicPlaying = purplemusic.is_playing()

func _ready():
	set_process_input(true)
	if musicPlaying == true:
		get_node("CanvasLayer/musica").set_normal_texture(load("res://assets/button_music1.png"))
	else:
		get_node("CanvasLayer/musica").set_normal_texture(load("res://assets/button_music3.png"))

func _input(event):
	var moedas = user_data_manager.get_data("coins")
	get_node("CanvasLayer/display/number").set_text(str(moedas))

func _on_retomar_pressed():
	get_node("CanvasLayer/Anim").play("out")
	yield(get_node("CanvasLayer/Anim"), "finished")
	transition.clear_above()


func _on_inventory_pressed():
	transition.clear_above()
	transition.put_above("res://scenes/Inventory.tscn")

func _on_musica_pressed():
	if musicPlaying == true:
		purplemusic.stop()
		get_node("CanvasLayer/musica").set_normal_texture(load("res://assets/button_music3.png"))
		musicPlaying = purplemusic.is_playing()
	else:
		purplemusic.play()
		get_node("CanvasLayer/musica").set_normal_texture(load("res://assets/button_music1.png"))
		musicPlaying = purplemusic.is_playing()