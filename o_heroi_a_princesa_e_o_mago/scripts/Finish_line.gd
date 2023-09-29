extends MarginContainer


func _input(event):
	if event.is_action_pressed("left_click"):
		get_tree().change_scene("res://scenes/MainMenu.tscn")
