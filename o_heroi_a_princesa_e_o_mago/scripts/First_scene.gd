extends MarginContainer

const second_scene = preload("res://scenes/segunda cena.tscn")


func _on_Button_pressed():
	get_parent().add_child(second_scene.instance())
	queue_free()
