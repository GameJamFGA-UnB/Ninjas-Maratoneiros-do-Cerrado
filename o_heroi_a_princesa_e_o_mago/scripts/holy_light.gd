extends Node2D

var entered = false
const instruction_scene = "res://scenes/Instructon_scene.tscn"

func _process(delta):
	if entered == true:
		get_tree().change_scene(instruction_scene)


func _on_Area2D_body_entered(body):
	entered = true

func _on_Area2D_body_exited(body):
	entered = false
