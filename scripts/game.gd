extends Node
var purplemusic = transition.get_node("PurpleMusic")
var numb = transition.get_node("Numb")

onready var perc = get_node("personagem")
onready var camera = get_node("dead_camera")
var moedas = 0
var vidas = 3

func _ready():
	transition.set_hearts(vidas)
	set_process(true)


func _process(delta):
	get_node("canvasLayer/controles/Panel/time").set_text(str(int(get_node("gameTime").get_time_left())))
	vidas = transition.get_hearts()
	if vidas == 2:
		get_node("canvasLayer/controles/Panel/heart3").set_texture(load("res://assets/hud_heartEmpty.png"))
		get_node("canvasLayer/controles/Panel/heart4").set_texture(load("res://assets/hud_heartFull.png"))
		get_node("canvasLayer/controles/Panel/heart5").set_texture(load("res://assets/hud_heartFull.png"))
	elif vidas == 1:
		get_node("canvasLayer/controles/Panel/heart3").set_texture(load("res://assets/hud_heartEmpty.png"))
		get_node("canvasLayer/controles/Panel/heart4").set_texture(load("res://assets/hud_heartEmpty.png"))
		get_node("canvasLayer/controles/Panel/heart5").set_texture(load("res://assets/hud_heartFull.png"))
	elif vidas <= 0:
		get_node("canvasLayer/controles/Panel/heart3").set_texture(load("res://assets/hud_heartEmpty.png"))
		get_node("canvasLayer/controles/Panel/heart4").set_texture(load("res://assets/hud_heartEmpty.png"))
		get_node("canvasLayer/controles/Panel/heart5").set_texture(load("res://assets/hud_heartEmpty.png"))
	elif vidas >= 3:
		get_node("canvasLayer/controles/Panel/heart3").set_texture(load("res://assets/hud_heartFull.png"))
		get_node("canvasLayer/controles/Panel/heart4").set_texture(load("res://assets/hud_heartFull.png"))
		get_node("canvasLayer/controles/Panel/heart5").set_texture(load("res://assets/hud_heartFull.png"))

func change_camera():
	camera.set_global_pos(perc.get_node("camera").get_camera_pos())
	camera.make_current()

func _on_personagem_morreu():
	change_camera()
	get_node("spawn_time").set_wait_time(2)
	get_node("spawn_time").start()
	transition.set_hearts(vidas-1)

func _on_spawn_time_timeout():
	if vidas > 0:
		reviver()
	else:
		transition.fade_to("res://scenes/levelSelect.tscn")
		numb.stop()
		purplemusic.play()

func reviver():
	perc.set_pos(get_node("spawn_point").get_pos())
	perc.reviver()
	get_node("gameTime").set_wait_time(30)
	get_node("gameTime").start()


func _on_personagem_fim():
	change_camera()
	transition.fade_to("res://scenes/game2.tscn")
	user_data_manager.set_data("score1", 1)
	user_data_manager.save_data()

func _on_personagem_moeda():
	moedas += 1
	get_node("canvasLayer/controles/Panel/moedas").set_text(str(moedas))


func _on_Menu_pressed():
	transition.put_above("res://scenes/Menu.tscn")



