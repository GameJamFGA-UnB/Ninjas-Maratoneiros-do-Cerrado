extends Label

func _on_TextureButton_pressed():
	var valor = int(get_text())
	valor = valor - 1
	if valor < 1:
		get_tree().change_scene("res://scenes/fase_ferreiro.tscn")
	set_text(String(valor))


func _on_relogio_timeout():
	get_tree().change_scene("res://cenas/GameOver.tscn")
