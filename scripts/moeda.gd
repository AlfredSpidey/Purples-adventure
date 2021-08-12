extends Area2D


func _ready():
	get_node("sprite/anim").play("current")


func _on_moeda_body_enter( body ):
	body.moeda()
	get_node("sprite/anim").play("coletar")
	get_node("shape").queue_free()
	yield(get_node("sprite/anim"), "finished")
	queue_free()
