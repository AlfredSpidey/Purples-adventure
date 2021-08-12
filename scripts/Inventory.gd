extends Node2D

var ItemClass = preload("res://scenes/Item.tscn")
var items = user_data_manager.get_data("items")

onready var inventory_slots = get_node("CanvasLayer/ItemsGrid")
var holding_item = null

func _ready():
	fillInventory()
	set_process_input(true)

func fillInventory():
	for i in range(0, items.size()):
		var slot = get_node("CanvasLayer/ItemsGrid/Slot"+str(i+1))
		if slot.item == null:
			slot.add_child(renderItem(items[i]))

func renderItem(data):
	var item = ItemClass.instance()
	item.name = data.name
	item.texture = data.texture
	return item

func _input(event):
	get_node("CanvasLayer/CoinNumber").set_text(str(user_data_manager.get_data("coins")))

func _on_BackButton_pressed():
	transition.clear_above()
	transition.set_hearts(transition.get_hearts()+1)

func handleSlotClick(index, event):
	if event.type == InputEvent.MOUSE_BUTTON:
		if event.button_index == BUTTON_LEFT and event.pressed:
			var item = get_node("CanvasLayer/ItemsGrid/Slot"+str(index)).get_child(0)
			if item != null:
				print(item.name)
			else:
				print("Empty Slot")

func _on_Slot1_input_event( ev ):
	handleSlotClick(1,ev)


func _on_Slot2_input_event( ev ):
	handleSlotClick(2,ev)


func _on_Slot3_input_event( ev ):
	handleSlotClick(3,ev)


func _on_Slot4_input_event( ev ):
	handleSlotClick(4,ev)


func _on_Slot5_input_event( ev ):
	handleSlotClick(5,ev)


func _on_Slot6_input_event( ev ):
	handleSlotClick(6,ev)


func _on_Slot7_input_event( ev ):
	handleSlotClick(7,ev)


func _on_Slot8_input_event( ev ):
	handleSlotClick(8,ev)


func _on_Slot9_input_event( ev ):
	handleSlotClick(9,ev)


func _on_Slot10_input_event( ev ):
	handleSlotClick(10,ev)


func _on_Slot11_input_event( ev ):
	handleSlotClick(11,ev)


func _on_Slot12_input_event( ev ):
	handleSlotClick(12,ev)
