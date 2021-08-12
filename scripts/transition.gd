extends CanvasLayer

var next_path

var above_node

var hearts = 0

func fade_to(path):
	next_path = path
	get_node("anim").play("fade")

func change_scene():
	if next_path != null:
		get_tree().change_scene(next_path)
	
func put_above(path):
	if above_node != null:
		return
	get_tree().set_pause(true)
	above_node = load(path).instance()
	get_tree().get_root().add_child(above_node)

func clear_above():
	if above_node == null:
		return
	get_tree().set_pause(false)
	get_tree().get_root().remove_child(above_node)
	above_node = null

func set_hearts(heart):
	hearts = heart
	if hearts > 3:
		hearts = 3

func get_hearts():
	return hearts