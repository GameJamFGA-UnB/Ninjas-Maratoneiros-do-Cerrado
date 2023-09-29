extends MarginContainer

const first_scene = preload("res://scenes/First_scene.tscn")

onready var select_one = $CenterContainer/VBoxContainer/CenterContainer3/VBoxContainer/CenterContainer/HBoxContainer/Selector
onready var select_two = $CenterContainer/VBoxContainer/CenterContainer3/VBoxContainer/CenterContainer2/HBoxContainer/Selector

var current_selection = 0

func _ready():
	set_current_selection(0)
	
func _process(delta):
	if Input.is_action_just_pressed("ui_down") and current_selection < 1:
		current_selection += 1
		set_current_selection(current_selection)
	elif Input.is_action_just_pressed("ui_up") and current_selection > 0:
		current_selection -= 1
		set_current_selection(current_selection)
	elif Input.is_action_just_pressed("ui_accept"):
		handle_selection(current_selection)

func handle_selection(_current_selection):
	if _current_selection == 0:
		get_parent().add_child(first_scene.instance())
		queue_free()
	elif _current_selection == 1:
		get_tree().quit()

func set_current_selection(_current_selection):
	select_one.text = ""
	select_two.text = ""
	if _current_selection == 0:
		select_one.text = ">"
	elif _current_selection == 1:
		select_two.text = ">"
