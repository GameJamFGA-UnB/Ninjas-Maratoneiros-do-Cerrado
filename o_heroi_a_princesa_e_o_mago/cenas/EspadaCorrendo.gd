extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	print_debug("Espada criada")
	position = Vector2(1100, 500)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x -= 600 * delta
	

	
