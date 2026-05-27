extends CharacterBody2D

@export var speed = 200.0

var min_pos = Vector2(-280, -55)
var max_pos = Vector2(385, 80)

func _physics_process(delta: float) -> void:
	# Allowing main player to move w, a, s, d
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	if direction:
		velocity = direction * speed
	else:
		velocity = velocity.move_toward(Vector2.ZERO, speed)

	move_and_slide()
	
	# Limiting movement in a rectangle
	var dir = Vector2.ZERO
	dir.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	dir.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	velocity = dir.normalized() * speed
	move_and_slide()
	global_position.x = clamp(global_position.x, min_pos.x, max_pos.x)
	global_position.y = clamp(global_position.y, min_pos.y, max_pos.y)
