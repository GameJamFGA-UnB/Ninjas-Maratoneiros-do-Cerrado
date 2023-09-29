extends MarginContainer

const ferreiro_map = "res://scenes/fase_ferreiro.tscn"

func _on_Button_pressed():
	get_tree().change_scene(ferreiro_map)
