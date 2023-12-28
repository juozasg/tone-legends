extends Node

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()
	if event is InputEventKey and event.as_text_keycode() == 'Q':
		get_tree().quit()
