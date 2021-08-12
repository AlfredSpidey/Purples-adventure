extends RichTextLabel

var dialog = ["Hello my name is purple","oooooooooooooooooooooooooooooooooooooo"]
var page = 0

func set_current_dialog(d):
	get_node("Anim").play("popUp")
	dialog.clear()
	dialog = d
	set_bbcode(dialog[page])
	set_visible_characters(0)
	set_process_input(true)



func _input(event):
	if event.type == InputEvent.SCREEN_TOUCH and event.is_pressed():
		if get_visible_characters() > get_total_character_count():
			if page < dialog.size()-1:
				page+= 1
				set_bbcode(dialog[page])
				set_visible_characters(0)
			elif page == dialog.size()-1:
				get_node("Anim").play("popUp (copy)")
		else:
			set_visible_characters(get_total_character_count())


func _on_Timer_timeout():
	set_visible_characters(get_visible_characters()+1)
