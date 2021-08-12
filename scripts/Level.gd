extends Area2D

export(int) var level = 0

func _ready():
	get_node("number").set_text(str(level))
