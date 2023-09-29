extends KinematicBody2D

var speed = Vector2(128, 128)
var last_mouse_pos = null
var entered = false

func _input(event):
	if event.is_action_pressed("left_click"):
		last_mouse_pos = get_viewport().get_mouse_position()
		entered = false

func _physics_process(delta):
	
	if last_mouse_pos:
		var direction_vector = (last_mouse_pos - global_position)
		
		if direction_vector.length() < 3 or entered == true:
			if $AnimatedSprite.animation == "walk_back":
				$AnimatedSprite.play("idle_back")
			elif $AnimatedSprite.animation == "walk_front":
				$AnimatedSprite.play("idle_front")
			elif $AnimatedSprite.animation == "walk_left":
				$AnimatedSprite.play("idle_left")
			return
	
		var velocity = move_and_slide(direction_vector.normalized() * speed)
		
		if velocity.x > velocity.y and velocity.x < -velocity.y:
			$AnimatedSprite.play("walk_back")
		elif velocity.x < velocity.y and velocity.x > -velocity.y:
			$AnimatedSprite.play("walk_front")
		elif velocity.x > 0:
			$AnimatedSprite.flip_h = true
			$AnimatedSprite.play("walk_left")
		else:
			$AnimatedSprite.flip_h = false
			$AnimatedSprite.play("walk_left")

func _on_Area2D_body_entered(body):
	entered = true
