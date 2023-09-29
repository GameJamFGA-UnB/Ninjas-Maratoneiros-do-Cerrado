extends MarginContainer

const second_scene = "res://scenes/segunda cena.tscn"


func _on_Button_pressed():
	get_tree().change_scene(second_scene)
