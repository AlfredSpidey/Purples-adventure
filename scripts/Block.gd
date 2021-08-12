extends StaticBody2D
var is_ani_started = false


func destruirBlock():
	if (!is_ani_started):
		get_node("Anim").play("Levantando")
		is_ani_started = true
	
	
	
func _onAnimationEnded():
	is_ani_started = false
	get_node("Sprite").queue_free()
	get_node("CollisionShape2D").queue_free()
	
	
	

