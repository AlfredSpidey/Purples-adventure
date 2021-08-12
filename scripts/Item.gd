extends Node2D
var name = null
var texture = null
func _ready():
	if texture != null:
		get_node("TextureFrame").set_texture(load(texture))