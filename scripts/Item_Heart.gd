extends Control

signal btnPressed


func _on_TextureButton_pressed():
	emit_signal("btnPressed")
	
	



