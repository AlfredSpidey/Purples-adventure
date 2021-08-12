extends RichTextLabel

var dialog = ["Hello my name is purple","and Im alfred"]
var page = 0



func _on_Timer_timeout():
	set_visible_characters(get_visible_characters()+1)




func _on_Area2D_body_enter( body ):
	get_node("Anim").play("popup")
	set_bbcode(dialog[page])
	set_process_input(true)


func _input(event):
	if event.type == InputEvent.SCREEN_TOUCH and event.is_pressed():
		if get_visible_characters() > get_total_character_count():
			if page < dialog.size()-1:
				page+= 1
				set_bbcode(dialog[page])
				set_visible_characters(0)
		else:
			set_visible_characters(get_total_character_count())


func _on_Area2D_body_exit( body ):
	page = 0
	get_node("Anim").play("popup (copy)")
	
