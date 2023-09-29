extends MarginContainer

const ferreiro_map = preload("res://scenes/fase_ferreiro.tscn")

func _on_Button_pressed():
	get_parent().add_child(ferreiro_map.instance())
	queue_free()
