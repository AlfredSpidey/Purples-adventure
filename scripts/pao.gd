extends Area2D



func _on_pao_body_enter( body ):
	body.morrer()
	get_node("sprite/anim").play("coletar")
	get_node("shape").queue_free()
	yield(get_node("sprite/anim"), "finished")
	queue_free()
