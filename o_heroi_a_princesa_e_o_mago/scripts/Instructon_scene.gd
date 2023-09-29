extends MarginContainer

const minigame = "res://cenas/MinigameFundir.tscn"

func _input(event):
	if event.is_action_pressed("ui_accept"):
		get_tree().change_scene(minigame)
